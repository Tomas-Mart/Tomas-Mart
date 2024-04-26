//
//  BtnItem.swift
//  Wrappers
//
//  Created by Amina TomasMart on 09.04.2024.
//

import SwiftUI

struct BtnItem: View {
    @EnvironmentObject var cvm: LoginViewModel
    var body: some View {
        Button(action: {
            cvm.signOut()
        }, label: {
            Text("OUT")
        })
    }
}
