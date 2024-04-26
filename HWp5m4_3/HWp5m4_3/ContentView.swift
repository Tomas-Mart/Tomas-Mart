//
//  ContentView.swift
//  HWp5m4_3
//
//  Created by Amina TomasMart on 09.04.2024.
//

import SwiftUI

struct ContentView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    var album: [Album] = Album.getMenu()
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image("0")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .clipShape(Circle())
            }
            
            HStack {
                Text("Спонсоры")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundStyle(.black)
                Spacer()
            }
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns) {
                    ForEach(album, id: \.self) { element in
                        Card(image: element.image, name: element.name, age: element.age, icon: element.icon)
                    }
                }
            }
        }
        .padding()
        .foregroundStyle(.white)
    }
}

#Preview {
    ContentView()
}
