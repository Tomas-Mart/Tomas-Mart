//
//  Checker.swift
//  Checker
//
//  Created by Amina TomasMart on 24.04.2024.
//

import Foundation

class Checker {
    static let shared = Checker()
    private let login = "user123"
    private let password = "password321"
    
    private init(){}
    
    func check(enteredLogin: String, enteredPassword: String) -> Bool {
        return enteredLogin == login && enteredPassword == password
    }
}
