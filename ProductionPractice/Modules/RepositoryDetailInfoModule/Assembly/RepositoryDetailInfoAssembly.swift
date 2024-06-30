//
//  RepositoryDetailInfoAssembly.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 28.06.2024.
//

import Foundation

final class RepositoryDetailInfoAssembly {
    static func build() -> (RepositoryDetailInfoViewController, RepositoryDetailInfoDataStore) {
        let dataManager = RepositoryDetailInfoDataRepository(AppRepository: AppRepository())
        let presenter = RepositoryDetailInfoPresenter(dataManager: dataManager)
        let router = RepositoryDetailInfoRouter()
        let viewController = RepositoryDetailInfoViewController(presenter: presenter, router: router)
        return (viewController, presenter)
    }
}
