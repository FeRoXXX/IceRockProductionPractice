//
//  RepositoriesListDataRepository.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 05.06.2024.
//

import Foundation

final class RepositoriesListDataRepository {
    private let appRepository: AppRepository
    private var allRepositoriesInfo: [Repo] = []
    
    init(appRepository: AppRepository) {
        self.appRepository = appRepository
    }
}

extension RepositoriesListDataRepository: IRepositoriesListDataRepository {
    
    func getRepositories(url: String, completion: @escaping (Result<Array<Repo>, Error>) -> Void) {
        appRepository.getRepositories(url: url) { data, error in
            if let error {
                completion(.failure(error))
            }
            if let data {
                self.allRepositoriesInfo = data
                completion(.success(data))
            }
        }
    }
    
    func logOut() {
        appRepository.logOut()
    }
    
    func getRepositoriesFullInfo() -> [Repo] {
        return allRepositoriesInfo
    }
}
