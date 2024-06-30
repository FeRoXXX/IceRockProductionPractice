//
//  RepositoryDetailInfoDataRepository.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 28.06.2024.
//

import Foundation

final class RepositoryDetailInfoDataRepository {
    
    private let AppRepository: AppRepository
    
    init(AppRepository: AppRepository) {
        self.AppRepository = AppRepository
    }
}

extension RepositoryDetailInfoDataRepository: IRepositoryDetailInfoDataRepository {
    
    func getRepositoryFirstInfo(repoId: String, completion: @escaping(Result<RepoDetails, Error>) -> Void) {
        AppRepository.getRepository(repoId: repoId) { data, error in
            if let error {
                completion(.failure(error))
            }
            if let data {
                completion(.success(data))
            }
        }
    }
    
    func getRepositoryReadme(_ data: RequestDataModel, completion: @escaping(Result<String, Error>) -> Void) {
        AppRepository.getRepositoryReadme(ownerName: data.ownerName,
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
        AppRepository.logOut()
    }
}
