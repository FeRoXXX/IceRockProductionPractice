//
//  RepositoryDetailInfoDataRepository.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 28.06.2024.
//

import Foundation

final class RepositoryDetailInfoDataRepository {
    
    private let appRepository: AppRepository
    
    init(appRepository: AppRepository) {
        self.appRepository = appRepository
    }
}

extension RepositoryDetailInfoDataRepository: IRepositoryDetailInfoDataRepository {
    
    func getRepositoryFirstInfo(repoId: String, completion: @escaping(Result<RepoDetails, Error>) -> Void) {
        appRepository.getRepository(repoId: repoId) { data, error in
            if let error {
                completion(.failure(error))
            }
            if let data {
                completion(.success(data))
            }
        }
    }
    
    func getRepositoryReadme(_ data: RequestDataModel, completion: @escaping(Result<String, Error>) -> Void) {
        appRepository.getRepositoryReadme(ownerName: data.ownerName,
                                          repositoryName: data.repositoryName,
                                          branchName: data.branch) { data, error in
            if let error {
                completion(.failure(error))
            }
            if let data {
                completion(.success(data))
            }
        }
    }
    
    func logOut() {
        appRepository.logOut()
    }
}
