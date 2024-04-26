//
//  ContentView.swift
//  p3m4_6
//
//  Created by Amina TomasMart on 17.03.2024.
//

import SwiftUI

struct ContentView: View {
    let service = Service()
    @StateObject var viewModel = ViewModel()
    @State var text = "Поле для ввода кода. Состоит из 4-х ячеек, в каждой из которых можно ввести только одну цифру. Для ввода доступны только цифры, любые другие символы не отображаются. При вводе в ячейке цифры курсор автоматически переходит на ячейку справа. Изначальное положение курсора - крайняя левая ячейка."
    @State var isOn = false
    let users = ["User1", "User2", "User3", "User4", "User5", "User6", "User7"]
    var body: some View {
        NavigationView {
            VStack {
                
                VStack {
                    
                }
                ScrollView {
                    VStack {
                        Text("count - \(viewModel.count)")
                        Button("PLUS") {
                            viewModel.countPlus()
                        }
                    }
                    VStack {
                        ForEach(Array(users.enumerated()), id: \.offset) { index, ell in Button(ell) {
                            
                        }
                        .padding(.bottom, CGFloat(index)*10)
                    }
                }
                    VStack(spacing: 20) {
                        ForEach(users, id: \.self) { user in
                            CardItem(text: text) {
                                Text("name")
                                    .textStyle()
                                Spacer()
                                Text(user)
                                    .textStyle()
                            }
                        }
                        CardItem(text: text) {
                            Text("name")
                            Spacer()
                            Text("user")
                                .textStyle()
                            Spacer()
                            Text("qwertyuiop")
                        }
                    }
                    .padding()
                }
                
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                
                TextField("Name", text: $text)
                    .padding()
                    .background(Color.gray.opacity(0.5))
                    .onSubmit {
                        print(service.getSearchResults(q: text))
                    }
                
                NavigationLink {
                    SecondView(name: "Amina")
                } label: {
                    Text("Next")
                }
                
                Toggle(isOn: $isOn) {
                    Text("Notifications")
                }
                .onChange(of: isOn) { value in
                    service.onUserNotifications(isOn: value)
                }
            }
            .padding()
            .onAppear {
                print("Home")
            }
        }
        .searchable(text: $text, placement: .sidebar) {
            
        }
        .onSubmit(of: .search) {
            print("searchable")
        }
    }
}

struct CardItem<Content: View>: View {
    var text: String
    var content: Content
    init(text: String, @ViewBuilder content: () -> Content) {
        self.text = text
        self.content = content()
    }
    var body: some View {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    content
                }
                Text(text)
            }
            .padding()
            .background(.gray.opacity(0.1))
    }
}

struct SecondView: View {
    let service = Service()
    var name: String
    
    var body: some View {
        VStack {
            
        }
        .onAppear {
            let a = service.getData(name: name)
            print(a)
        }
    }
}

struct SecondView2: View {
    @State var random = 0
    var body: some View {
        VStack {
            Text("random - \(random)")
            Button("setRandom") {
                random = (0...1000).randomElement()!
            }
            ContentView()
        }
    }
}

class ViewModel: ObservableObject {
    @Published var count = 0
    
    func countPlus() {
        count += 1
    }
}

#Preview {
    SecondView2()
}

struct TextStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20, weight: .black))
            .foregroundStyle(.blue)
            .textCase(.uppercase)
    }
}

struct ImageOptions: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame()
            .aspectRatio(contentMode: .fill)
    }
}

extension Text {
    
    func textStyle() -> some View {
        modifier(TextStyle())
    }
}
