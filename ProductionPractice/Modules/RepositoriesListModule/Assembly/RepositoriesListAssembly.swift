//
//  RepositoriesListAssembly.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 30.05.2024.
//

final class RepositoriesListAssembly {
    static func build() -> (RepositoriesListViewController, RepositoriesListReceivedDataStore) {
        let dataSource = RepositoriesListTableViewDataSource()
        let dataManager = RepositoriesListDataRepository(AppRepository: AppRepository())
        let presenter = RepositoriesListPresenter(dataSource: dataSource, dataManager: dataManager)
        let router = RepositoriesListRouter(dataStore: presenter)
        let viewController = RepositoriesListViewController(presenter: presenter, router: router)
        return (viewController, presenter)
    }
}
