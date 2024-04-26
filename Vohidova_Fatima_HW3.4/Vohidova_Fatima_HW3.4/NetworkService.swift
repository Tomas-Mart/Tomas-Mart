//
//  NetworkService.swift
//  Vohidova_Fatima_HW3.4
//
//  Created by Amina TomasMart on 28.02.2024.
//

import Foundation

struct NetworkService {
    static func request(for configuration: AppConfiguration){
        switch configuration {
        case .people(let urlStr), .planets(let urlStr), .starships(let urlStr):
            guard let url = URL(string: urlStr) else {return}
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, let response = response as? HTTPURLResponse, error == nil else {fatalError("Ошибка: \(error?.localizedDescription ?? "")")}
                print("HTTP Status Code: \(response.statusCode)")
                print("HTTP Header Fields: \(response.allHeaderFields)")
                if let dataStr = String(data: data, encoding: .utf8) {
                    print("Полученные данные: \(dataStr)")
                }
            }
            task.resume()
        }
    }
}

