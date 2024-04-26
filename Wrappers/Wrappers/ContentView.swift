//
//  ContentView.swift
//  Wrappers
//
//  Created by Amina TomasMart on 08.04.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("App View")
                .font(.system(size: 40))
                .fontWeight(.black)
            BtnItem()
        }
    }
}

#Preview {
    ContentView()
}
