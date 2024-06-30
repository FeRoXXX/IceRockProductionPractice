//
//  IAuthDataRepository.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 09.06.2024.
//

import Foundation

protocol IAuthDataRepository {
    func signIn(_ token: String, completion: @escaping(Result<UserInfo, Error>) -> Void)
    func checkReEntry(completion: @escaping (Result<UserInfo, Error>) -> Void)
}
