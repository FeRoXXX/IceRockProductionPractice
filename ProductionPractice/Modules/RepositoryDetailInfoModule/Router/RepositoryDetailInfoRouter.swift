//
//  RepositoryDetailInfoRouter.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 28.06.2024.
//

import Foundation

final class RepositoryDetailInfoRouter {
    private weak var sourceVC: RepositoryDetailInfoViewController?
}

extension RepositoryDetailInfoRouter: IRepositoryDetailInfoRouter {
    
    func routToFirstViewController() {
        sourceVC?.navigationController?.popToRootViewController(animated: true)
    }
    
    func routToRepositoryListViewController() {
        sourceVC?.navigationController?.popViewController(animated: true)
    }
    
    func setupRouter(_ sourceVC: RepositoryDetailInfoViewController) {
        self.sourceVC = sourceVC
    }
}
