//
//  KeychainManager.swift
//  UserDefaultsKeychain
//
//  Created by Amina TomasMart on 23.04.2024.
//

import Foundation

enum KeychainError: Error {
    case duplicateItem
    case unknow(status: OSStatus)
}

final class KeychainManager {
    
    static func save(account: String, password: Data) throws -> String {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: account,
            kSecValueData: password
        ]
        let status = SecItemAdd(query as CFDictionary, nil)
        guard status != errSecDuplicateItem else {
            throw KeychainError.duplicateItem
        }
        guard status == errSecSuccess else {
            throw KeychainError.unknow(status: status)
        }
        return "saved"
    }
    
    static func getPassword(for account: String) throws -> Data? {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: account,
            kSecReturnData: kCFBooleanTrue as Any
        ]
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        guard status == errSecSuccess else {
            throw KeychainError.unknow(status: status)
        }
        return result as? Data
    }
}