//
//  ContentPage.swift
//  Wrappers
//
//  Created by Amina TomasMart on 09.04.2024.
//

import SwiftUI

struct ContentPage: View {
    @StateObject private var contentViewModel = ContentViewModel()
    @State private var name: String = "EMPTY"
    var body: some View {
        
        NavigationView(content: {
            VStack {
                Text(contentViewModel.userName)
                Text(contentViewModel.name)
                NavigationLink(destination: SecondPage(someText: $contentViewModel.name)) {
                    /*@START_MENU_TOKEN@*/Text("Navigate")/*@END_MENU_TOKEN@*/ }
            }
        })
        VStack {
            Text(contentViewModel.name)
            Button(action: {
                contentViewModel.name = "Amina"
            }, label: {
                Text("Button")
            })
            TextField("", text: $name, prompt: Text("Enter name").foregroundColor(.red))
            
        }
        .padding()
    }
}
