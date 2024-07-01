//
//  AuthViewController.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 05.06.2024.
//

import UIKit

final class AuthViewController: UIViewController {
    
    @IBOutlet private weak var componentView: AuthView!
    
    private let presenter: IAuthPresenter
    private let router: IAuthRouter
    
    init(presenter: IAuthPresenter, router: IAuthRouter) {
        self.presenter = presenter
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        router.setupUI(self)
        presenter.viewLoaded(ui: self)
    }
    
}

private extension AuthViewController {
    
    func setupUI() {
        setupDelegate()
        setupGesture()
        setupSignInButton()
    }
    
    func setupDelegate() {
        componentView.setupDelegate(self)
    }
    
    func setupGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(userHideKeyboard))
        view.addGestureRecognizer(gesture)
    }
    
    func setupSignInButton() {
        componentView.signInButtonClicked = { [weak self] text in
            guard let self else { return }
            self.presenter.checkAuth(text)
        }
    }
    
    @objc func userHideKeyboard() {
        presenter.hideKeyboard()
    }
}

extension AuthViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        presenter.textFieldIsSelected()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        presenter.userEndEditing(textField.text)
    }
}

extension AuthViewController: IAuthViewController {
    
    func useSelectColor() {
        componentView.useSelectColor()
    }
    
    func useUnselectedColor() {
        componentView.useUnselectedColor()
    }
    
    func hideKeyboard() {
        view.endEditing(true)
    }
    
    func hideErrorMessage() {
        componentView.hideErrorMessage()
    }
    
    func showError(_ text: String) {
        componentView.showError(text)
    }
    
    func startLoadingIndicator() {
        componentView.startActivityIndicator()
    }
    
    func stopLoadingIndicator() {
        componentView.stopActivityIndicator()
    }
    
    func successAuth() {
        router.routeToRepositoriesList()
    }
    
    func showAlert(_ alertText: String) {
        let alert = UIAlertController(title: MockData.Errors.Error.rawValue.localized(), message: alertText, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: MockData.Errors.Ok.rawValue.localized(), style: .default))
        self.present(alert, animated: true)
    }
}
