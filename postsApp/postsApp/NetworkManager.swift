//
//  NetworkManager.swift
//  postsApp
//
//  Created by Amina TomasMart on 15.03.2024.
//

import Foundation

enum postsResult {
    case success(posts: [Post])
    case error(error: Error)
}

class NetworkManager {
    let session = URLSession.shared
    let decoder = JSONDecoder()
    
    func getPosts(completion: @escaping (postsResult) -> Void) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        
        session.dataTask(with: url) { [weak self] data, response, error in
            var result: postsResult = .success(posts: [])
            defer {
                DispatchQueue.main.async {
                    completion(result)
                }
            }
            if error == nil, let data = data {
                print("Good")
                guard let posts = try? self?.decoder.decode([Post].self, from: data) else {return}
                result = .success(posts: posts)
            } else {
                print("Error: \(error!.localizedDescription)")
                result = .error(error: error!)
            }
        } .resume()
    }
}
