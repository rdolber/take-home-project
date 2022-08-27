//
//  NetworkManager.swift
//  Project-Take-Home
//
//  Created by Ray Dolber on 8/27/22.
//

import Foundation

final class NetworkManager {
    static let shared           = NetworkManager()
    private let baseUrl         = "https://api.github.com/users/"
    
    private init() { }
    
    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[Follower], GFError>) -> Void) {
        let endpoint = baseUrl + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            //completed(nil, .invalidUsername)
            completed(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
//                completed(nil, .unableToComplete)
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                completed(nil, .invalidResponse)
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
//                completed(nil, .invalidData)
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let followers = try decoder.decode([Follower].self, from: data)
//                completed(followers, nil)
                completed(.success(followers))
            } catch {
//                completed(nil, .invalidData)
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
