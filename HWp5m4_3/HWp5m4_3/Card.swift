//
//  Card.swift
//  HWp5m4_3
//
//  Created by Amina TomasMart on 09.04.2024.
//

import SwiftUI

struct Card: View {
    var album: [Album] = Album.getMenu()
    var image: String
    var name: String
    var age: String
    var icon: [String]
    var body: some View {
        ZStack {
            Image(image)
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: 240)
                .cornerRadius(10)

            VStack {
                HStack {
                    HStack(spacing: -8) {
                        Icon(image: icon)
                    }
                    
                    Spacer()
                    HStack {
                        switch icon.count {
                        case 1:
                            Text("\(icon.count) фонд")
                                .font(.system(size: 12, weight: .regular))
                        case 2...4:
                            Text("\(icon.count) фонда")
                                .font(.system(size: 12, weight: .regular))
                        default:
                            Text("\(icon.count) фондов")
                                .font(.system(size: 12, weight: .regular))
                        }
                        
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Text("...")
                                .font(.system(size: 20, weight: .black))
                        })
                    }
                }
                .padding()
                
                Spacer()
                
                VStack(spacing: 5) {
                    HStack {
                        Text("\(name), \(age)")
                            .font(.system(size: 16, weight: .bold))
                        Spacer()
                    }
                    HStack {
                        Button(action: {
                            
                        }, label: {
                            Text("пригласить")
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .font(.system(size: 14, weight: .regular))
                                .background(.red)
                                .cornerRadius(10)
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "xmark")
                                .padding(10)
                                .font(.system(size: 10, weight: .light))
                                .foregroundStyle(.red)
                                .background(.white)
                                .clipShape(Circle())
                        })
                    }
                }
                .padding()
            }
        }
    }
}
