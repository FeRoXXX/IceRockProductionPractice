//
//  RepositoriesListRouter.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 28.06.2024.
//

import Foundation

final class RepositoriesListRouter {
    
    private weak var viewController: RepositoriesListViewController?
    private var dataStore: RepositoryListDataStore?
    
    init(dataStore: RepositoryListDataStore) {
        self.dataStore = dataStore
    }
}

extension RepositoriesListRouter: IRepositoriesListRouter {
    
    func routeToRepositoryDetail() {
        guard let viewController,
              let dataStore else { return }
        
        var (destinationVC, destinationDS) = RepositoryDetailInfoAssembly.build()
        
        passDataToDetail(source: dataStore, destination: &destinationDS)
        navigateToDetail(source: viewController, destination: destinationVC)
    }
    
    func routeToFirstViewController() {
        viewController?.navigationController?.popToRootViewController(animated: true)
    }
    
    func setupUI(_ viewController: RepositoriesListViewController) {
        self.viewController = viewController
    }
}

private extension RepositoriesListRouter {
    
    func navigateToDetail(source: RepositoriesListViewController, destination: RepositoryDetailInfoViewController) {
        source.navigationController?.pushViewController(destination, animated: true)
    }
    
    func passDataToDetail(source: RepositoryListDataStore, destination: inout RepositoryDetailInfoDataStore) {
        destination.dataStore = source.chosenRepository
    }
}
