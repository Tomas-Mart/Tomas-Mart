//
//  ContentView.swift
//  SwiftUIBasics
//
//  Created by Amina TomasMart on 04.04.2024.
//

import SwiftUI

struct ContentView: View {
    var menu: [MyMenu] = MyMenu.getMenu()
    @State var isActive  = false
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink("Next") {
                    ModelData()
                }
                
                ModelData()
                
                Spacer()
                
                Divider()
                    .background(.red)
                
                Button(action: {
                    isActive.toggle()
                }, label: {
                    Text(isActive ? "Button" : "Кнопка")
                })
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        Spacer()
                        ForEach(menu, id: \.self) { item in
                            Menu(image: item.image, text: item.text)
                        }
                        Spacer()
                    }
                }
                
                Divider()
                    .background(.red)
                
                Spacer()
                
                SecondView()
                
                NavigationLink("Next") {
                    SecondView()
                }
                
            }
        }
    }
}

struct Menu:  View {
    @State var image: String
    @State var text: String
    private let service = Service()
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                Button(action:  {
                    setData()
                    service.setMenu()
                }, label: {
                    Image(systemName: image)
                        .padding(.top, 5)
                        .padding(.leading, 10)
                        .padding(.bottom, 100)
                        .padding(.trailing, 100)
                        .font(.system(size: 30))
                        .foregroundColor(.red)
                })
                Text(text)
                    .padding(.top, 50)
                    .padding(.leading, 10)
                    .padding(.trailing, 5)
                Spacer()
            }
            .frame(maxWidth: 150, maxHeight: 150, alignment: .leading)
            .background(.gray)
            .foregroundStyle(.white)
            .cornerRadius(20)
            
            VStack(alignment: .center) {
                TextField("Enter", text: $text)
                    .padding()
            }
            .background(.gray)
            .foregroundStyle(.white)
            .clipShape(.capsule)
        }
    }
    
    func setData() {
        print("Ok")
    }
}

struct ModelData: View {
    var body: some View {
        Image(systemName: "globe")
        Text("ModelData")
    }
}

struct SecondView: View {
    var body: some View {
        Text("SecondView")
        Image(systemName: "globe")
    }
}

#Preview {
    ContentView()
}
