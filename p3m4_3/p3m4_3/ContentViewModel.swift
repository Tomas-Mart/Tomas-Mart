//
//  ContentViewModel.swift
//  p3m4_3
//
//  Created by Amina TomasMart on 15.03.2024.
//

import Foundation

class ContentViewModel: ObservableObject {
    
    @Published var isLogin = false
    @Published var name = ""
    @Published var items = [String]()
    func someFunc() {
        
    }
}
