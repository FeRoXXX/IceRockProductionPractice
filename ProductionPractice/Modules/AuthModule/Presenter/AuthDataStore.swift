//
//  AuthDataStore.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 26.06.2024.
//

import Foundation

protocol AuthDataStore {
    var repositoryData: AccountModel? { get set }
}
