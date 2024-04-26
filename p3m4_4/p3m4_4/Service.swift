//
//  Service.swift
//  p3m4_4
//
//  Created by Amina TomasMart on 15.03.2024.
//

import Foundation

class Service {
    
    func getNews(value: String, limit: String, lang: String, completion: @escaping ([OneNews]) -> ()) {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "newsapi.org"
        urlComponents.path = "/v2/everything"
        
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: value),
            URLQueryItem(name: "pageSize", value: limit),
            URLQueryItem(name: "language", value: lang),
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
                let result = try JSONDecoder().decode(Responce.self, from: resdata)
                completion(result.articles)
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}

struct Responce: Codable {
    let articles: [OneNews]
}

struct OneNews: Codable, Hashable {
    let author: String?
    let title: String?
    let urlToImage: String?
    let url: String?
    let description: String?
}
