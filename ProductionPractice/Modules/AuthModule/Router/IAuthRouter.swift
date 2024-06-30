//
//  IAuthRouter.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 26.06.2024.
//

import Foundation

protocol IAuthRouter {
    func routeToRepositoriesList()
    func setupUI(_ viewController: AuthViewController)
}
