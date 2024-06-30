//
//  AuthDataRepository.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 09.06.2024.
//

import Foundation

final class AuthDataRepository {
    
    private let appRepository: AppRepository
    private let keyValueStorage: KeyValueStorage = KeyValueStorage()
    
    init(AppRepository: AppRepository) {
        self.appRepository = AppRepository
    }
}

extension AuthDataRepository: IAuthDataRepository {
    
    func signIn(_ token: String, completion: @escaping (Result<UserInfo, Error>) -> Void) {
        appRepository.signIn(token: token) { data, error in
            if let error {
                completion(.failure(error))
            }
            if let data {
                completion(.success(data))
            }
        }
    }
    
    func checkReEntry(completion: @escaping (Result<UserInfo, Error>) -> Void) {
        guard let token = keyValueStorage.getAuthToken() else { return }
        appRepository.signIn(token: token) { data, error in
            if let error {
                completion(.failure(error))
            }
            if let data {
                completion(.success(data))
            }
        }
    }
}
