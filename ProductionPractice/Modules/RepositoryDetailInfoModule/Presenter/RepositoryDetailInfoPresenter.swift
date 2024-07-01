//
//  RepositoryDetailInfoPresenter.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 28.06.2024.
//

import Foundation

final class RepositoryDetailInfoPresenter: RepositoryDetailInfoDataStore {
    private weak var ui: IRepositoryDetailInfoViewController?
    private let dataManager: IRepositoryDetailInfoDataRepository
    private var requestData: RequestDataModel?
    var dataStore: ChoseRepositoryModel?
    
    init(dataManager: IRepositoryDetailInfoDataRepository) {
        self.dataManager = dataManager
    }
}

extension RepositoryDetailInfoPresenter: IRepositoryDetailInfoPresenter {
    
    func viewLoaded(_ ui: IRepositoryDetailInfoViewController) {
        self.ui = ui
        fetchGlobalData {
            self.fetchFirstData()
        }
    }
    
    func backButtonAction() {
        ui?.goToRepositoriesList()
    }
    
    func globalAlertButtonTapped() {
        self.ui?.hideAlert()
        fetchGlobalData {
            self.fetchFirstData()
        }
    }
    
    func readmeAlertButtonTapped() {
        self.ui?.hideAlert()
        fetchReadmeData {
            self.fetchReadme()
        }
    }
    
    func logOutButtonAction() {
        dataManager.logOut()
        ui?.goToAuth()
    }
    
    func urlTapped(_ url: String?) {
        guard let urlString = url,
            let url = URL(string: urlString) else { return }
        ui?.goToURL(url)
    }
}

private extension RepositoryDetailInfoPresenter {
    
    func fetchGlobalData(completion: @escaping(() -> Void)) {
        NetworkReachabilityService.shared.checkInternetConnection {
            completion()
        } failure: {
            DispatchQueue.main.async {
                self.ui?.setupError(.loadError)
            }
        }
    }
    
    func fetchReadmeData(completion: @escaping(() -> Void)) {
        NetworkReachabilityService.shared.checkInternetConnection {
            completion()
        } failure: {
            DispatchQueue.main.async {
                self.ui?.setupReadMeError(.loadError)
            }
        }
    }
    
    func fetchFirstData() {
        guard let repoId = dataStore?.repositoryID else { return }
        ui?.startLoadingGlobal()
        dataManager.getRepositoryFirstInfo(repoId: repoId) { result in
            DispatchQueue.main.async {
                self.ui?.stopLoadingGlobal()
            }
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.ui?.setupTitle(data.name)
                    self.ui?.setupFirstInfo(FirstInfoModel(githubUrlRepo: data.githubUrlRepo,
                                                     license: data.license?.spdx,
                                                     stats: RepositoryStatsModel(stars: String(data.stargazers),
                                                                                 forks: String(data.forks),
                                                                                 watchers: String(data.watchers))))
                }
                self.requestData = RequestDataModel(ownerName: data.owner.login,
                                                    repositoryName: data.name,
                                                    branch: data.branch)
                self.fetchReadmeData {
                    self.fetchReadme()
                }
            case .failure(_):
                DispatchQueue.main.async {
                    self.ui?.setupError(.somethingError)
                }
            }
        }
    }
    
    func fetchReadme() {
        guard let requestData = self.requestData else { return }
        DispatchQueue.main.async {
            self.ui?.startLoadingReadMe()
        }
        self.dataManager.getRepositoryReadme(requestData) { result in
            DispatchQueue.main.async {
                self.ui?.stopLoadingReadMe()
            }
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self.ui?.setupReadme(success)
                }
            case .failure(_):
                DispatchQueue.main.async {
                    self.ui?.setupReadMeError(.emptyReadme)
                }
            }
        }
    }
}
