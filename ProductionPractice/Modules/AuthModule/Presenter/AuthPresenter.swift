//
//  AuthPresenter.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 08.06.2024.
//

import Foundation

final class AuthPresenter: AuthDataStore {
    
    private weak var ui: IAuthViewController?
    private var dataManager: IAuthDataRepository
    var repositoryData: AccountModel?
    
    init(dataManager: IAuthDataRepository) {
        self.dataManager = dataManager
    }
}

extension AuthPresenter: IAuthPresenter {
    
    func viewLoaded(ui: IAuthViewController) {
        self.ui = ui
        ui.startLoadingIndicator()
        dataManager.checkReEntry { [weak self] result in
            switch result {
            case .success(let success):
                self?.repositoryData = AccountModel(repositoryURL: success.urlRepositories)
                ui.successAuth()
                DispatchQueue.main.async {
                    ui.stopLoadingIndicator()
                }
            case .failure(_):
                DispatchQueue.main.async {
                    ui.showAlert(MockData.Errors.alertMessage.rawValue.localized())
                }
            }
        }
        DispatchQueue.main.async {
            ui.stopLoadingIndicator()
        }
    }
    
    func textFieldIsSelected() {
        ui?.useSelectColor()
        ui?.hideErrorMessage()
    }
    
    func userEndEditing(_ text: String?) {
        guard let text else { return }
        if text.isEmpty {
            ui?.useUnselectedColor()
        }
    }
    
    func hideKeyboard() {
        ui?.hideKeyboard()
    }
    
    func checkAuth(_ token: String?) {
        NetworkReachabilityService.shared.checkInternetConnection {
            self.checkToken(token)
        } failure: {
            DispatchQueue.main.async {
                self.ui?.showAlert(MockData.Errors.alertMessage.rawValue.localized())
            }
        }
    }
}

private extension AuthPresenter {
    
    func checkToken(_ token: String?) {
        ui?.hideKeyboard()
        guard let token,
            !token.isEmpty else {
            ui?.showError(MockData.Errors.invalidToken.rawValue)
            return
        }
        ui?.startLoadingIndicator()
        DispatchQueue.main.async { [weak self] in
            self?.dataManager.signIn(token) { [weak self] result in
                switch result {
                case .success(let success):
                    self?.repositoryData = AccountModel(repositoryURL: success.urlRepositories)
                    self?.ui?.successAuth()
                case .failure(_):
                    self?.ui?.showError(MockData.Errors.invalidToken.rawValue.localized())
                }
                self?.ui?.stopLoadingIndicator()
            }
        }
    }
}
