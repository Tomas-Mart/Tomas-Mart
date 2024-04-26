//
//  LoginView.swift
//  p3m4_3
//
//  Created by Amina TomasMart on 15.03.2024.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var contentViewModel: ContentViewModel
    var body: some View {
        Text("Login!")
        Button {
            contentViewModel.isLogin = true
        } label: {
            Text("auth")
        }
    }
}

#Preview {
    LoginView()
}
