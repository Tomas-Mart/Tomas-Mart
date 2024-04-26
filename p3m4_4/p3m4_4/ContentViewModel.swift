//
//  ContentViewModel.swift
//  p3m4_4
//
//  Created by Amina TomasMart on 15.03.2024.
//

import Foundation

class ContentViewModel: ObservableObject {
    private let service = Service()
    @Published var news = [OneNews]()
    
    init(){
        getAllNews()
    }
    
    private func getAllNews() {
        service.getNews(value: "iphone 15", limit: "100", lang: "ru") { items in
            self.news = items
        }
    }
}
