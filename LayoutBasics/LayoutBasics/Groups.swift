//
//  Groups.swift
//  LayoutBasics
//
//  Created by Amina TomasMart on 05.04.2024.
//

import SwiftUI

struct Groups: View {
    var body: some View {
        VStack {
            Spacer()
            
            Group {
                Button(action: {
                    
                }, label: {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                })
                
                Text("Hello, world!")
            }
            
            Form {
                Section {
                    Text("test")
                    Text("test")
                    Text("test")
                }
                
                Section {
                    Text("test")
                    Text("test")
                    Text("test")
                }
                
                Section {
                    Text("test")
                    Text("test")
                    Text("test")
                }
            }
            
            Group {
                Button(action: {
                    
                }, label: {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                })
               
                Text("Hello, world!")
            }
        }
        .padding()
    }
}

