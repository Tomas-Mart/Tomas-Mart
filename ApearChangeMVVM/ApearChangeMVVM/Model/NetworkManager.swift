//
//  NetworkManager.swift
//  ApearChangeMVVM
//
//  Created by Amina TomasMart on 25.04.2024.
//

import Foundation

class NetworkManager {
    
    func getNews(q: String, count: Int, completion: @escaping ([Article]) -> ()) {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "newsapi.org"
        urlComponents.path = "/v2/everything"
        
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: q),
            URLQueryItem(name: "pageSize", value: "\(count)"),
            URLQueryItem(name: "language", value: "ru"),
            URLQueryItem(name: "apiKey", value: "aff504f8cf6441a6aa23397d39a07323")
        ]
        
        guard let url = urlComponents.url else {return}
        print(url)
        let req = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: req) { data, response, error in
            guard error == nil, let resdata = data else {
                print(error!.localizedDescription)
                return
            }
            
            do {
                let result = try JSONDecoder().decode(News.self, from: resdata)
                completion(result.articles)
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}

struct News: Decodable {
    let articles: [Article]
}

struct Article: Decodable, Hashable {
    let source: Source
    let author: String?
    let title: String?
    let description: String?
    let urlToImage: String?
}

struct Source: Decodable, Hashable {
    let name: String?
}

