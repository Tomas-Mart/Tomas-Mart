//
//  ContentView.swift
//  LayoutBasics
//
//  Created by Amina TomasMart on 05.04.2024.
//

import SwiftUI

struct ContentView: View {
    @State var isActive = false
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                Card()
                Card()
                Card()
                Card()
                Card()
            }
        }
        .padding(.horizontal, 30)
    }
}

struct Card: View {
    var body: some View {
        ZStack {
            Image(.unknown)
                .resizable()
                .frame(height: 300)
            
            VStack(alignment: .trailing) {
                HStack {
                    LikeBtn()
                    Rectangle()
                        .frame(width: 20, height: 0)
                }
                Spacer()
                
                VStack(alignment: .leading, spacing: 15) {
                    VStack(alignment: .leading, spacing: 10) {
                        HStack(spacing: 20) {
                            Text("4 фотографии")
                            Text("2 комментария")
                        }
                        .padding(.horizontal, 20)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 5) {
                                
                                TagItem(tag: "Офисы")
                                TagItem(tag: "СберСпасибо")
                                TagItem(tag: "Банкоматы")
                                TagItem(tag: "Наличные")
                                TagItem(tag: "Терминалы")
                            }
                            .padding(.horizontal, 20)
                        }
                    }
                    Text("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                        .padding(.horizontal, 20)
                    
                }
            }
            .padding(.vertical, 30)
            .background{
                LinearGradient(colors: [.indigo, .clear], startPoint: .bottom, endPoint: .center)
            }
        }
        .frame(maxWidth: .infinity)
        .foregroundStyle(.white)
        .cornerRadius(20)    }
}

struct TagItem: View {
    var tag: String
    var body: some View {
        Text(tag)
            .padding(.vertical, 5)
            .padding(.horizontal, 20)
            .background(.opacity(0.3))
            .clipShape(.capsule)
    }
}

struct LikeBtn: View {
    @State var isActive = false
    var body: some View {
        Button(action: {
            isActive.toggle()
        }, label: {
            isActive ? Image(systemName: "heart.fill") : Image(systemName: "heart")
        })
    }
}

#Preview {
    ContentView()
}
