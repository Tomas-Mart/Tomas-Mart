//
//  ContentView.swift
//  p5m4_2
//
//  Created by Amina TomasMart on 29.02.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            ZStack {
                Color.black
                VStack {
                    VStack(spacing: 25) {
                        ScrollView(.horizontal) {
                            HStack(spacing: 20) {
                                TagImg(tag: .img1)
                                TagImg(tag: .img2)
                            }
                            .padding(.top, 30)
                        }
                        
                        ScrollView(.horizontal) {
                            HStack(spacing: 10) {
                                TagItem(tag: "Природа")
                                TagItem(tag: "Природа")
                                TagItem(tag: "Природа")
                                TagItem(tag: "Природа")
                                TagItem(tag: "Природа")
                            }
                        }
                    }
                    .padding(.all, 20)
                    
                    Spacer(minLength: 30)
                    
                    VStack(alignment: .leading, spacing: 50) {
                        TagText(tag: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrudexercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit")
                        
                        TagVStack(tag1: "16.12.23", tag2: "Ut enim ad minim veniam, quis nostrud exercit ation ullamco laboris nisi ")
                        
                        TagVStack(tag1: "16.12.23", tag2: "Ut enim ad minim veniam, quis nostrud exercit ation ullamco laboris nisi ")
                    }
                    .padding(.horizontal, 40)
                    
                    Spacer(minLength: 40)
                    
                    Btn()
                    
                    Spacer(minLength: 20)
                    
                }
                .foregroundStyle(.white)
            }
        }
        .ignoresSafeArea(edges: .all)
    }
}

struct TagImg: View {
    var tag: UIImage
    var body: some View {
        Image(uiImage: tag)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(maxWidth: 250, maxHeight: 400)
            .clipShape(.rect(cornerRadius: 30))
    }
}

struct TagItem: View {
    var tag: String
    var body: some View {
        Text(tag)
            .font(.system(size: 15, weight: .regular))
            .padding(.vertical, 5)
            .padding(.horizontal, 15)
            .background(.opacity(0.2))
            .clipShape(.rect(cornerRadius: 20))
    }
}

struct TagText: View {
    var tag: String
    var body: some View {
        Text(tag)
            .font(.system(size: 15, weight: .regular))
    }
}

struct TagVStack: View {
    var tag1: String
    var tag2: String
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(tag1)
                .font(.system(size: 15, weight: .bold))
            Text(tag2)
                .font(.system(size: 15, weight: .regular))
        }
    }
}

struct Btn: View {
    var body: some View {
        Button(action: {
        }, label: {
            Text("Добавить комментарий")
                .frame(width: 370, height: 50)
                .foregroundStyle(.gray)
                .font(.system(size: 15, weight: .regular))
                .background(.white)
                .clipShape(.rect(cornerRadius: 20))
        })
    }
}

#Preview {
    ContentView()
}
