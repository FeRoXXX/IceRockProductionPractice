//
//  CustomTokenInput.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 08.06.2024.
//

import UIKit

final class CustomTokenInput: UIView {
    
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupUI()
    }
}

extension CustomTokenInput {
    
    func textFieldSelected() {
        textField.layer.borderColor = Colors.CustomTokenInput.borderColorSelected.cgColor
        textField.placeholder = ""
    }
    
    func textFieldNotSelected() {
        textField.attributedPlaceholder = NSAttributedString(string: MockData.CustomTokenInput.accessToken.rawValue.localized(), attributes: [.foregroundColor: Colors.CustomTokenInput.placeholderColor])
        textField.layer.borderColor = #colorLiteral(red: 0.130880475, green: 0.1483016014, blue: 0.1788249612, alpha: 1)
    }
    
    func hideErrorMessage() {
        errorLabel.isHidden = true
    }
    
    func useErrorLabel(_ text: String) {
        errorLabel.isHidden = false
        errorLabel.text = text
        textField.layer.borderColor = Colors.CustomTokenInput.borderColorError.cgColor
    }
    
    func setupDelegate(_ delegate: UITextFieldDelegate) {
        textField.delegate = delegate
    }
    
    func getText() -> String? {
        textField.text
    }
}

private extension CustomTokenInput {
    func setupView() {
        let subview = loadViewFromXib()
        self.addSubview(subview)
    }
    
    func loadViewFromXib() -> UIView {
        guard let bundle = Bundle.main.loadNibNamed("CustomTokenInput", owner: self)?.first as? UIView else { return UIView() }
        return bundle
    }
    
    func setupUI() {
        customizeTextField()
    }
    
    func customizeTextField() {
        textField.attributedPlaceholder = NSAttributedString(string: MockData.CustomTokenInput.accessToken.rawValue.localized(), attributes: [.foregroundColor: Colors.CustomTokenInput.placeholderColor])
        textField.layer.borderColor = #colorLiteral(red: 0.130880475, green: 0.1483016014, blue: 0.1788249612, alpha: 1)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        textField.leftViewMode = .always
    }
}
