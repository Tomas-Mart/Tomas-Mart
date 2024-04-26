//
//  Service.swift
//  p3m4_6
//
//  Created by Amina TomasMart on 17.03.2024.
//

import Foundation

class Service {
    
    func getData(name: String) -> String {
        return "Data"
    }
    
    func getSearchResults(q: String) -> String {
        return "SearchResults"
    }
    
    func onUserNotifications(isOn: Bool) {
        if isOn {
            print("ON")
        } else {
            print("OFF")
        }
    }
}
