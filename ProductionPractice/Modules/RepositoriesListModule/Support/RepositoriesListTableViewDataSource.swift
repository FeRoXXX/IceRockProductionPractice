//
//  RepositoriesTableViewDataSource.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 30.05.2024.
//

import UIKit

protocol IRepositoriesListTableViewDataSource: UITableViewDataSource {
    func setupData(model: [RepositoryDescriptionModel])
}

final class RepositoriesListTableViewDataSource: NSObject {
    private var requestData: [RepositoryDescriptionModel] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requestData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoriesListTableViewCell", for: indexPath) as? RepositoriesListTableViewCell else {
            return UITableViewCell()
        }
        cell.setupData(model: requestData[indexPath.row])
        return cell
    }
}

extension RepositoriesListTableViewDataSource: IRepositoriesListTableViewDataSource {
    func setupData(model: [RepositoryDescriptionModel]) {
        requestData = model
    }
}
