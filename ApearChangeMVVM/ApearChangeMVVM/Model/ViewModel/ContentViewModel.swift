//
//  ContentViewModel.swift
//  ApearChangeMVVM
//
//  Created by Amina TomasMart on 25.04.2024.
//

import Foundation

class ContentViewModel: ObservableObject {
    private let networkManager = NetworkManager()
    @Published var articles: [Article] = []
    init(){getNews()}
    func getNews() {
        networkManager.getNews(q: "ios", count: 100) { [weak self] articles in
            DispatchQueue.main.async {
                self?.articles = articles
            }
        }
    }
    func setNotify(isOn: Bool) {
        if isOn {
            print("On")
        } else {
            print("Off")
        }
    }
}
