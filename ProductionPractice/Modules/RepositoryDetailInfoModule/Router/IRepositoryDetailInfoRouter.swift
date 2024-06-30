//
//  IRepositoryDetailInfoRouter.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 28.06.2024.
//

import Foundation

protocol IRepositoryDetailInfoRouter {
    func routToFirstViewController()
    func routToRepositoryListViewController()
    func setupRouter(_ sourceVC: RepositoryDetailInfoViewController)
}
