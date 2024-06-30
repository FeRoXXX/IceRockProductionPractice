//
//  IRepositoryDetailInfoDataRepository.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 28.06.2024.
//

import Foundation

protocol IRepositoryDetailInfoDataRepository {
    func getRepositoryFirstInfo(repoId: String, completion: @escaping(Result<RepoDetails, Error>) -> Void)
    func getRepositoryReadme(_ data: RequestDataModel, completion: @escaping(Result<String, Error>) -> Void)
    func logOut()
}
