//
//  Album.swift
//  HWp5m4_3
//
//  Created by Amina TomasMart on 09.04.2024.
//

import Foundation

struct Album: Hashable {
    var image: String
    var name: String
    var age: String
    var icon: [String]
    
    static func getMenu() -> [Album] {
        
        let menu1 = Album(image: "1", name: "Ирина", age: "20", icon: ["7", "8", "9"])
        
        let menu2 = Album(image: "2", name: "Оля", age: "22", icon: ["7", "8"])
        
        let menu3 = Album(image: "3", name: "Света", age: "22", icon: ["7", "8", "9", "10"])
        
        let menu4 = Album(image: "4", name: "Кристина", age: "25", icon: ["7"])
        
        let menu5 = Album(image: "5", name: "София", age: "20", icon: ["7", "8", "9"])
        
        let menu6 = Album(image: "6", name: "Екатерина", age: "22", icon: ["7", "8"])
        
        return [menu1, menu2, menu3, menu4, menu5, menu6]
    }
}
