//
//  SecondPage.swift
//  Wrappers
//
//  Created by Amina TomasMart on 09.04.2024.
//

import SwiftUI

struct SecondPage: View {
    @Binding var someText: String
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            TextField("Text", text: $someText)
            Button(action: {
                someText = "Name"
                dismiss()
            }, label: {
                Text("Set text")
            })
        }
    }
}


