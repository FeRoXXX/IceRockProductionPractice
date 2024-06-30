//
//  KeyValueStorage.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 04.06.2024.
//

import Foundation

protocol IKeyValueStorage {
    func saveAuthToken(token: String)
    func deleteAuthToken()
}

final class KeyValueStorage {
    private var authToken: String? {
        UserDefaults.standard.string(forKey: "AuthToken")
    }
}

extension KeyValueStorage: IKeyValueStorage {
    func saveAuthToken(token: String) {
        UserDefaults.standard.setValue(token, forKey: "AuthToken")
    }
    
    func deleteAuthToken() {
        UserDefaults.standard.removeObject(forKey: "AuthToken")
    }
    
    func getAuthToken() -> String?{
        authToken
    }
}
