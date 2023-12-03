//
//  Request.swift
//  Learning
//
//  Created by Ainash Turbayeva on 28.11.2023.
//

import UIKit

final class Request {
    
    static let shared = Request()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerUrl = baseURL + "appetizers"
    
    var cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func getAppetizers(completed: @escaping (Result <[Appetizer], APErrors>) -> Void) {
        guard let url = URL(string: appetizerUrl) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decoderResponse = try decoder.decode(AppetizerResponse.self, from: data)
                completed(.success(decoderResponse.request))
            }catch {
                completed(.failure(.unableToComplete))
            }
            
        }
        
        task.resume()
    }
    
    func downloadImage(fromURlString urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        let cachKey =  NSString(string: urlString)
        
        if let image = cache.object(forKey: cachKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cachKey)
            completed(image)
        }
        task.resume()
    }
    
}
