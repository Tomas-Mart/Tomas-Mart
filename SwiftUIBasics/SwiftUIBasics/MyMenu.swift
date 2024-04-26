//
//  MyMenu.swift
//  SwiftUIBasics
//
//  Created by Amina TomasMart on 05.04.2024.
//

import Foundation

struct MyMenu: Hashable {
    var image: String
    var text: String
    
    static func getMenu() -> [MyMenu] {
        
        let menu1 = MyMenu(image: "heart.circle", text: "Вакансии рядом с вами")
        
        let menu2 = MyMenu(image: "person.circle", text: "Поднять резюме в поиске\nПоднять")
        
        let menu3 = MyMenu(image: "star.circle", text: "Временная работа и подработка")
        
        let menu4 = MyMenu(image: "staroflife.circle", text: "Полезные статьи и советы")
        
        let menu5 = MyMenu(image: "clock.circle", text: "Недавно просмотренные")
                
        return [menu1, menu2, menu3, menu4, menu5]
    }
}

