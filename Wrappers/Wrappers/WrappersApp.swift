//
//  WrappersApp.swift
//  Wrappers
//
//  Created by Amina TomasMart on 08.04.2024.
//

import SwiftUI

@main
struct WrappersApp: App {
    @StateObject private var loginViewModel = LoginViewModel()
    var body: some Scene {
        WindowGroup {
            if loginViewModel.isLogin {
                ContentView()
                    .environmentObject(loginViewModel)
            } else {
                Login()
                    .environmentObject(loginViewModel)
            }
        }
    }
}
