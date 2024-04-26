//
//  LoginViewModel.swift
//  Wrappers
//
//  Created by Amina TomasMart on 09.04.2024.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var isLogin = false
    
    func setAuth() {
        isLogin = true
    }
    
    func signOut() {
        isLogin = false
    }
}
