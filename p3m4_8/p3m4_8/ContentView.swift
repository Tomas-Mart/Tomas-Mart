//
//  ContentView.swift
//  p3m4_8
//
//  Created by Amina TomasMart on 19.03.2024.
//

import SwiftUI

struct ContentView: View {
    @State var isShowPicker = false
    @State var image = UIImage(named: "Tree")
    var body: some View {
        
        VStack {
            MyCollectionView(image: $image)
                .frame(width: 300, height: 400)
            Image(uiImage: image!)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .imageScale(.large)
                .foregroundStyle(.tint)
            NavigationLink {
                WebPage()
            }label: {
                Text("open page")
            }
            Button("Show picker") {
                isShowPicker.toggle()
            }
            .sheet(isPresented: $isShowPicker) {
                ImagePicker(image: $image)
            }
        }
        .padding()
    }
}

struct WebPage: View {
    @State var loaded = false
    var body: some View {
        ZStack {
            WebView(stringUrl: "https://error-nil.namari.ru", loaded: $loaded)
            if !loaded {
                ProgressView()
            }
        }
    }
}

#Preview {
    NavigationView {
        ContentView()
    }
}
