//
//  Login.swift
//  Wrappers
//
//  Created by Amina TomasMart on 09.04.2024.
//

import SwiftUI

struct Login: View {
    @EnvironmentObject var cvm: LoginViewModel
    var body: some View {
        VStack {
            Text("Login View")
                .font(.system(size: 40))
                .fontWeight(.black)
            Button(action: {
                cvm.setAuth()
            }, label: {
                Text("SignIn")
            })
        }
    }
}
