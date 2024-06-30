//
//  IRepositoriesListPresenter.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 04.06.2024.
//

import Foundation

protocol IRepositoriesListPresenter {
    func viewLoaded(ui: IRepositoriesListView)
    func cellIsSelected(_ index: Int)
    func logOutButtonAction()
    func refreshButtonTapped()
}
