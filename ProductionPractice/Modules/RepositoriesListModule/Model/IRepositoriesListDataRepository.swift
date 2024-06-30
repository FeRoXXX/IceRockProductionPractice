//
//  IRepositoriesListDataManager.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 05.06.2024.
//

import Foundation

protocol IRepositoriesListDataRepository {
    func getRepositories(url: String, completion: @escaping(Result<Array<Repo>, Error>) -> Void)
    func getRepositoriesFullInfo() -> [Repo]
    func logOut()
}
