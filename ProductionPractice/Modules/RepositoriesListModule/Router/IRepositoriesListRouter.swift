//
//  IRepositoriesListRouter.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 28.06.2024.
//

import Foundation

protocol IRepositoriesListRouter {
    func routeToRepositoryDetail()
    func setupUI(_ viewController: RepositoriesListViewController)
    func routeToFirstViewController()
}
