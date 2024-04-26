//
//  ContentView.swift
//  ApearChangeMVVM
//
//  Created by Amina TomasMart on 25.04.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var contentViewModel = ContentViewModel()
    @State var text = ""
    @State var searchText = ""
    @State var isOn = true
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    TextField("text", text: $text)
                        .padding(10)
                        .background(.gray)
                        .onSubmit {
                            print(text)
                        }
                    Toggle("Notification", isOn: $isOn)
                        .onChange(of: isOn, initial: false) { oldValue, newValue in
                            contentViewModel.setNotify(isOn: newValue)
                        }
                }
                
                Spacer()
                
                ScrollView {
                    LazyVStack {
                        ForEach(contentViewModel.articles, id: \.self) { item in
                            Text(item.author ?? "Данных нет")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(10)
                                .background(.gray)
                                .foregroundStyle(.white)
                        }
                    }
                }
            }
            .padding(20)
        }
        .navigationTitle("Main")
        .searchable(text: $searchText)
        .onSubmit(of: .search) {
            print(searchText)
        }
    }
}

#Preview {
    ContentView()
}
