//
//  DateSelectionCalendarViewController.swift
//  AutobusAlmaty
//
//  Created by Ramazan Amangeldin on 18/03/2024.
//

import UIKit
import HorizonCalendar

final class DateSelectionCalendarViewController: UIViewController {
    public var didSelectDay: ((Day) -> Void)?
    public var selectedDay: Day?
    
    private lazy var calendarView = CalendarView(initialContent: self.makeContent())
    
    private func makeContent() -> CalendarViewContent {
        let calendar = Calendar.current
        let currentDate = Date()
        let endDate = calendar.date(byAdding: .year, value: 1, to: currentDate)!
        
        return CalendarViewContent(
            calendar: calendar,
            visibleDateRange: currentDate...endDate,
            monthsLayout: .vertical(options: VerticalMonthsLayoutOptions()))
        .dayItemProvider { day in
            var invariantViewProperties = DayLabel.InvariantViewProperties(
                font: .light14,
                textColor: .black,
                backgroundColor: .primaryWhite)
            
            if day == self.selectedDay {
                invariantViewProperties.textColor = .primaryWhite
                invariantViewProperties.backgroundColor = .primaryBlue
            }

            return DayLabel.calendarItemModel(invariantViewProperties: invariantViewProperties, viewModel: .init(day: .init(day: "\(day.day)")))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        setupCalendarView()
    }
    
    private func configUI() {
        view.backgroundColor = .primaryWhite
        
        let titleLabel = UILabel()
        titleLabel.text = "Date of travel"
        titleLabel.font = .bold16
        view.addSubview(calendarView)
        calendarView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalToSuperview().offset(20)
            $0.bottom.equalToSuperview()
        }
    }
    
    private func setupCalendarView() {
        calendarView.scroll(toMonthContaining: Date(), scrollPosition: .centered, animated: false)
        calendarView.daySelectionHandler = { [weak self] day in
            guard let self else { return }
            
            self.selectedDay = day
            
            let newContent = self.makeContent()
            self.calendarView.setContent(newContent)

            DispatchQueue.main.async {
                self.didSelectDay?(day)
                self.dismiss(animated: true)
            }
        }
    }
}

struct DayComponents {
    var day: String
}

struct DayLabel: CalendarItemViewRepresentable {
    static func setViewModel(_ viewModel: Content, on view: UILabel) {
        view.text = viewModel.day.day
    }
    
    typealias ViewType = UILabel
    typealias ViewModel = Content
    
    /// Properties that are set once when we initialize the view.
    struct InvariantViewProperties: Hashable {
        var font: UIFont
        var textColor: UIColor
        var backgroundColor: UIColor
    }
    
    /// Properties that will vary depending on the particular date being displayed.
    struct Content: Equatable {
        static func == (lhs: DayLabel.Content, rhs: DayLabel.Content) -> Bool {
            return lhs.day.day > rhs.day.day
        }
        
        let day: DayComponents
    }
    
    static func makeView(
        withInvariantViewProperties invariantViewProperties: InvariantViewProperties)
    -> UILabel
    {
        let label = UILabel()
        
        label.backgroundColor = invariantViewProperties.backgroundColor
        label.font = invariantViewProperties.font
        label.textColor = invariantViewProperties.textColor
        
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.cornerRadius = 12
        
        return label
    }
    
    static func setContent(_ content: Content, on view: UILabel) {
        view.text = "\(content.day.day)"
    }
}
