//
//  ContentView.swift
//  p3m4_3
//
//  Created by Amina TomasMart on 15.03.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var contentViewModel: ContentViewModel
    var body: some View {
        NavigationView {
            VStack {
                Text("Auth")
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text(contentViewModel.name)
                NavigationLink {
                    SecondView(userName: $contentViewModel.name, name: "Test")
                } label: {
                    Text("text")
                }

            }
            .padding()
        }
    }
}

struct SecondView: View {
    @Binding var userName: String
    var name: String
    var body: some View {
        VStack {
            NavigationLink {
                SettingView()
            } label: {
                Text("setting")
            }
        }
    }
}

struct SettingView: View {
    @EnvironmentObject var contentViewModel: ContentViewModel
   
    var body: some View {
        VStack {
            Text(contentViewModel.name)
            Button {
                contentViewModel.isLogin = false
            } label: {
                Text("Log out")
            }
        }
    }
}

