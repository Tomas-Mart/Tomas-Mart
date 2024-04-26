//
//  p3m4_3App.swift
//  p3m4_3
//
//  Created by Amina TomasMart on 15.03.2024.
//

import SwiftUI

@main
struct p3m4_3App: App {
    @StateObject var contentViewModel = ContentViewModel()

    var body: some Scene {
        WindowGroup {
            if contentViewModel.isLogin {
                ContentView()
                    .environmentObject(contentViewModel)
            } else {
                LoginView()
                    .environmentObject(contentViewModel)
            }
        }
    }
}
