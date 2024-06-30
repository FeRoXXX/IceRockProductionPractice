//
//  RepositoriesListPresenter.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 04.06.2024.
//

import Foundation

final class RepositoriesListPresenter: RepositoriesListReceivedDataStore, RepositoryListDataStore {
    private let dataSource: IRepositoriesListTableViewDataSource
    private let dataManager: IRepositoriesListDataRepository
    private weak var ui: IRepositoriesListView?
    private var repositoriesInfo: [RepositoryDescriptionModel] = []
    var receivedData: AccountModel?
    var chosenRepository: ChoseRepositoryModel?
    
    init(dataSource: IRepositoriesListTableViewDataSource, dataManager: IRepositoriesListDataRepository) {
        self.dataSource = dataSource
        self.dataManager = dataManager
    }
}

extension RepositoriesListPresenter: IRepositoriesListPresenter {
    func viewLoaded(ui: IRepositoriesListView) {
        self.ui = ui
        
        ui.setupDataSource(dataSource: dataSource)
        ui.setupDelegate()

        fetchData()
    }
    
    func cellIsSelected(_ index: Int) {
        let allData = dataManager.getRepositoriesFullInfo()
        guard index < allData.count else { return }
        let selectedCell = allData[index]
        chosenRepository = ChoseRepositoryModel(repositoryID: String(selectedCell.id), 
                                                ownerName: selectedCell.owner.login)
        ui?.goToDetail()
    }
    
    func refreshButtonTapped() {
        fetchData()
    }
    
    func logOutButtonAction() {
        dataManager.logOut()
        ui?.goToFirstView()
    }
}

private extension RepositoriesListPresenter {
    
    func fetchData() {
        ui?.startLoading()
        guard let receivedData else { fatalError() }
        NetworkReachabilityService.shared.checkInternetConnection {
            self.dataManager.getRepositories(url: receivedData.repositoryURL) { [weak self] result in
                guard let self else { return }
                switch result {
                case .success(let success):
                    self.repositoriesInfo = success.map {
                        RepositoryDescriptionModel(name: $0.name,
                                                   language: $0.language,
                                                   description: $0.description)
                    }
                    if self.repositoriesInfo.isEmpty {
                        DispatchQueue.main.async {
                            self.ui?.setupError(.emptyError)
                        }
                    } else {
                        dataSource.setupData(model: self.repositoriesInfo)
                        DispatchQueue.main.async {
                            self.ui?.updateTable()
                            self.ui?.hideAlert()
                        }
                    }
                case .failure(_):
                    DispatchQueue.main.async {
                        self.ui?.stopLoading()
                        self.ui?.setupError(.somethingError)
                    }
                }
            }
        } failure: {
            self.ui?.stopLoading()
            self.ui?.setupError(.connectionError)
        }
    }
}
