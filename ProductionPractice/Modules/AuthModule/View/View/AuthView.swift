//
//  AuthView.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 05.06.2024.
//

import UIKit

final class AuthView: UIView {
    
    @IBOutlet private weak var tokenInputTextField: CustomTokenInput!
    @IBOutlet private weak var signInButton: CustomInputButton!
    
    var signInButtonClicked: ((String?) -> Void)?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupButton()
    }
}

private extension AuthView {
    
    func setupView() {
        let subview = loadViewFromXib()
        self.addSubview(subview)
    }
    
    func loadViewFromXib() -> UIView {
        guard let bundle = Bundle.main.loadNibNamed("AuthView", owner: self)?.first as? UIView else { return UIView() }
        return bundle
    }
    
    func setupButton() {
        signInButton.buttonClicked = { [weak self] in
            guard let self else { return }
            self.signInButtonClicked?(tokenInputTextField.textField.text)
        }
    }
}

extension AuthView {
    
    func startActivityIndicator() {
        signInButton.startLoading()
    }
    
    func stopActivityIndicator() {
        signInButton.stopLoading()
    }
    
    func setupDelegate(_ delegate: UITextFieldDelegate) {
        tokenInputTextField.textField.delegate = delegate
    }
    
    func useSelectColor() {
        tokenInputTextField.textFieldSelected()
    }
    
    func useUnselectedColor() {
        tokenInputTextField.textFieldNotSelected()
    }
    
    func hideErrorMessage() {
        tokenInputTextField.hideErrorMessage()
    }
    
    func showError(_ text: String) {
        tokenInputTextField.useErrorLabel(text)
    }
}
