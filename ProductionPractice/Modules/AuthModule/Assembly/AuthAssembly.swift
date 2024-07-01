//
//  AuthAssembly.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 08.06.2024.
//

import UIKit

final class AuthAssembly {
    static func build() -> UIViewController {
        let dataManager = AuthDataRepository(appRepository: AppRepository())
        let presenter = AuthPresenter(dataManager: dataManager)
        let router = AuthRouter(dataStore: presenter)
        let controller = AuthViewController(presenter: presenter, router: router)
        return controller
    }
}
