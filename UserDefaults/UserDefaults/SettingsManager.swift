//
//  SettingsManager.swift
//  UserDefaults
//
//  Created by Amina TomasMart on 17.04.2024.
//

import Foundation

class SettingsManager {
    static let shared = SettingsManager()
    private let sortingKey = "sortingEnabled"
    private let photoSizeKey = "photoSizeEnabled"
    var isSortingEnabled: Bool {
        get {
            return UserDefaults.standard.bool(forKey: sortingKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: sortingKey)
        }
    }
    var isPhotoSizeEnabled: Bool {
        get {
            return UserDefaults.standard.bool(forKey: photoSizeKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: photoSizeKey)
        }
    }
    private init(){}
}
