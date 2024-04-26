//
//  ContentView.swift
//  p3m4_7
//
//  Created by Amina TomasMart on 18.03.2024.
//

import SwiftUI

struct ContentView: View {
    @State var isShow = false
    @State var selected = ""
    @State var items = ["Text1", "Text2", "Text3", "Text4", "Text5"]
    @State var text = ""
    @State var isOn = false
    @State var startPos: CGFloat = 1.0
    @State var finishPos: CGFloat = 0

    var body: some View {
        VStack {
            Button {
                isShow.toggle()
            } label: {
                Text("show alert")
            }
            .alert("Alert", isPresented: $isShow) {
                TextField("", text: $text)
                TextField("", text: $text)

                Button("Cancel", role: .cancel) {
                    //
                }
                Button("Destructive", role: .destructive) {
                    //
                }
                Button("Ok", role: .cancel) {
                    //
                }
            } message: {
                Text("More info")
            }

        }
        NavigationView {
            List {
                Section {
                    ForEach(items, id: \.self) { item in
                        NavigationLink {
                            Text(item)
                                .onTapGesture {
                                    //
                                }
                        } label: {
                            Text(item)
                        }
                    }
                    .onDelete(perform: { indexSet in
                        items.remove(atOffsets: indexSet)
                    })
                }
                Text("Секция 1").tag("1")
                Text("Секция 2").tag("2")
                Text("Секция 3").tag("3")
                Text("Секция 4").tag("4")
                Text("Секция 5").tag("5")
                
                Section {
                    Text("Секция 1").tag("1")
                    Button("Test") {
                        //
                    }
                    Text("Секция 2").tag("2")
                    Text("Секция 3").tag("3")
                    Text("Секция 4").tag("4")
                    Text("Секция 5").tag("5")
                }
            }
        }
        NavigationView {
            Picker("LocalizedStringKey", selection: $selected) {
                Text("Секция 1").tag("1")
                Text("Секция 2").tag("2")
                Text("Секция 3").tag("3")
                Text("Секция 4").tag("4")
                Text("Секция 5").tag("5")
            }
            .pickerStyle(.palette)
            .onChange(of: selected) { value in
                print(value)
            }
            Form {
                Section {
                    TextField("login", text: $text)
                    TextField("password", text: $text)
                    Text("Секция 1")
                    Text("Секция 2")
                    Text("Секция 3")
                    Text("Секция 4")
                    Text("Секция 5")
                } header: {
                    Text("Настройки")
                } footer: {
                    Text("Экран")
                }
                Section {
                    Text(selected)
                    NavigationLink {
                        
                    } label: {
                        Text("Вход")
                    }
                    Toggle("Notify", isOn: $isOn)
                    
                    Picker("LocalizedStringKey", selection: $selected) {
                        Text("Секция 1").tag("1")
                        Text("Секция 2").tag("2")
                        Text("Секция 3").tag("3")
                        Text("Секция 4").tag("4")
                        Text("Секция 5").tag("5")
                    }
                    .onChange(of: selected) { value in
                        print(value)
                    }
                }
            }
        }
        VStack {
           
            Text("Hello, world!")
                .scaleEffect(startPos+finishPos)
                .gesture(
                    MagnificationGesture()
                        .onChanged({ val in
                            print(val)
                            finishPos += val
                            print("onChanged")
                        })
                        .onEnded({ val in
                            print(val)
                            startPos += finishPos
                            finishPos = 0
                            print("onEnded")
                        })
                )
                .onTapGesture(count: 2) {
                    isOn.toggle()
                    startPos = 1
                }
            if isOn {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
