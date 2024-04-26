//
//  SecondView.swift
//  ApearChangeMVVM
//
//  Created by Amina TomasMart on 25.04.2024.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        NavigationView{
            NavigationLink(destination: ContentView()) {
                Text("Next")
            }
        }
    }
}

#Preview {
    SecondView()
}
