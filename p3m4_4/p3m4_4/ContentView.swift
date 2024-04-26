//
//  ContentView.swift
//  p3m4_4
//
//  Created by Amina TomasMart on 15.03.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var contentViewModel = ContentViewModel()
    
    var body: some View {
        
        NavigationView {
            
            ScrollView(.vertical, showsIndicators: false) {
                
                LazyVStack(spacing: 30) {
                    
                    ForEach(contentViewModel.news, id: \.self) { item in
                        ContentViewItem(item: item)
                    }
                }
                .padding()
            }
            .navigationTitle("News")
        }
    }
}

struct ContentViewItem: View {
    var item: OneNews
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            VStack(alignment: .leading) {
                Text(item.title ?? "")
                    .font(.system(size: 20, weight: .bold))
                
                Text(item.author ?? "")
                    .font(.system(size: 14, weight: .light))
            }
            
            AsyncImage(url: URL(string: item.urlToImage ?? "")) { img in
                img
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
            } placeholder: {
                ProgressView()
            }
            
            Text(item.description ?? "")
                .lineLimit(.max)
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(20)
    }
}

#Preview {
    ContentView()
}
