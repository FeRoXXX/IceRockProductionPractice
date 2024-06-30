//
//  AuthRouter.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 26.06.2024.
//

import Foundation

final class AuthRouter {
    
    private weak var viewController: AuthViewController?
    private var dataStore: AuthDataStore?
    
    init(dataStore: AuthDataStore) {
        self.dataStore = dataStore
    }
}

extension AuthRouter: IAuthRouter {
    
    func routeToRepositoriesList() {
        guard let dataStore,
              let viewController else { return }
        var (destinationVC, destinationDS) = RepositoriesListAssembly.build()
        
        passDataToRepositoriesList(source: dataStore, destination: &destinationDS)
        navigateToRepositoriesList(source: viewController, destination: destinationVC)
    }
    
    func setupUI(_ viewController: AuthViewController) {
        self.viewController = viewController
    }
}

private extension AuthRouter {
    
    func navigateToRepositoriesList(source: AuthViewController, destination: RepositoriesListViewController) {
        source.navigationController?.pushViewController(destination, animated: true)
    }
    
    func passDataToRepositoriesList(source: AuthDataStore, destination: inout RepositoriesListReceivedDataStore) {
        destination.receivedData = source.repositoryData
    }
}
