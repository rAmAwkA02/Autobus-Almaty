//
//  APICaller.swift
//  AutobusAlmaty
//
//  Created by Ramazan Amangeldin on 04/03/2024.
//

import Foundation

struct User: Codable {
    let username: String
    let password: String
}

struct UserREST: Codable {
//    let username: String
//    let password: String
    let token: String
}

class APICaller {
    
    static let shared = APICaller()
    
    func login(user: User, completion: @escaping (Result<String, Error>) -> Void) {
        
        let urlString = "https://technomad-diploma.up.railway.app/login?username=\(user.username)&password=\(user.password)"
        
        let url = URL(string: urlString)
        
        var request = URLRequest(url: url!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let stringResponse = String(data: data, encoding: .utf8)
                    
                    completion(.success(stringResponse!))
                    
                } catch let error {
                    print("Error was \(error)")
                    completion(.failure(error))
                }
            }
            
            if let error = error {
                print("ERRRRROOR \(error)")
            }
            
        }
        task.resume()
        
    }

    func register(user: User, completion: @escaping (Result<UserREST, Error>) -> Void) {
        
        let urlString = "https://technomad-diploma.up.railway.app/registration"
        
        let url = URL(string: urlString)
        
        var request = URLRequest(url: url!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try! JSONEncoder().encode(user)
        request.httpMethod = "POST"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let articles = try decoder.decode(UserREST.self, from: data)
                        
                    completion(.success(articles))
                    
                } catch let error {
                    completion(.failure(error))
                }
            }
            
            if let error = error {
                print("ERRRRROOR \(error)")
            }
            
        }
        task.resume()
        
    }
    
    func resend(user: User, completion: @escaping (Result<String, Error>) -> Void) {
        
        let urlString = "https://technomad-diploma.up.railway.app/registration/resend?username=\(user.username)"
        
        let url = URL(string: urlString)
        
        var request = URLRequest(url: url!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try! JSONEncoder().encode(user)
        request.httpMethod = "POST"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let stringResponse = String(data: data, encoding: .utf8)
                    
                    completion(.success(stringResponse!))
                } catch let error {
                    completion(.failure(error))
                }
            }
            
            if let error = error {
                print("ERRRRROOR \(error)")
            }
            
        }
        task.resume()
        
    }
    
    func confirmToken(token: String, completion: @escaping (Result<String, Error>) -> Void) {
        
        let urlString = "https://technomad-diploma.up.railway.app/registration/confirm?token=\(token)"

        let url = URL(string: urlString)
        
        var request = URLRequest(url: url!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let stringResponse = String(data: data, encoding: .utf8)
                    
                    completion(.success(stringResponse!))
                } catch let error {
                    completion(.failure(error))
                }
            }
            
            if let error = error {
                print("ERRRRROOR \(error)")
            }
            
        }
        task.resume()
        
    }
    
}
