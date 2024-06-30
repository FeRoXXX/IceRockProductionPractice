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
        dataManager.checkReEntry { [unowned self] result in
            switch result {
            case .success(let success):
                self.repositoryData = AccountModel(repositoryURL: success.urlRepositories)
                ui.successAuth()
                DispatchQueue.main.async {
                    ui.stopLoadingIndicator()
                }
            default:
                break
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
                self.ui?.showAlert(MockData.Errors.alertMessage.rawValue)
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
            guard let self else { return }
            dataManager.signIn(token) { [weak self] result in
                guard let self else { return }
                switch result {
                case .success(let success):
                    repositoryData = AccountModel(repositoryURL: success.urlRepositories)
                    ui?.successAuth()
                case .failure(_):
                    ui?.showError(MockData.Errors.invalidToken.rawValue)
                }
                ui?.stopLoadingIndicator()
            }
        }
    }
}
