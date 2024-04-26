//
//  Icon.swift
//  HWp5m4_3
//
//  Created by Amina TomasMart on 09.04.2024.
//

import SwiftUI

struct Icon: View {
    var album: [Album] = Album.getMenu()
    var image: [String]
    var body: some View {
        ForEach(image, id: \.self) { image in
            Image(image)
                .resizable()
                .frame(width: 16, height: 16)
                .clipShape(Circle())
                .padding(1)
                .background(.white)
                .clipShape(Circle())
        }
    }
}
