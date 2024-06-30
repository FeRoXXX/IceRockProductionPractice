//
//  IRepositoryDetailInfoPresenter.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 28.06.2024.
//

import Foundation

protocol IRepositoryDetailInfoPresenter {
    func viewLoaded(_ ui: IRepositoryDetailInfoViewController)
    func backButtonAction()
    func logOutButtonAction()
    func globalAlertButtonTapped()
    func readmeAlertButtonTapped()
}
