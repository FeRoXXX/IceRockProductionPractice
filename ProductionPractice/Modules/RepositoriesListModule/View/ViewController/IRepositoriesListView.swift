//
//  IRepositoriesListView.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 05.06.2024.
//

import Foundation

protocol IRepositoriesListView: AnyObject {
    func setupDataSource(dataSource: IRepositoriesListTableViewDataSource)
    func setupDelegate()
    func updateTable()
    func goToDetail()
    func setupError(_ error: MockData.Alerts)
    func startLoading()
    func stopLoading()
    func hideAlert()
    func goToFirstView()
}
