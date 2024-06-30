//
//  CustomTokenInput.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 08.06.2024.
//

import UIKit

final class CustomTokenInput: UIView {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupUI()
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
        textField.attributedPlaceholder = NSAttributedString(string: "Personal access token", attributes: [.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)])
        textField.layer.borderColor = #colorLiteral(red: 0.130880475, green: 0.1483016014, blue: 0.1788249612, alpha: 1)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        textField.leftViewMode = .always
    }
}

extension CustomTokenInput {
    
    func textFieldSelected() {
        textField.layer.borderColor = #colorLiteral(red: 0.3449212611, green: 0.6503628492, blue: 0.9986084104, alpha: 1)
        textField.placeholder = ""
    }
    
    func textFieldNotSelected() {
        textField.attributedPlaceholder = NSAttributedString(string: "Personal access token", attributes: [.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)])
        textField.layer.borderColor = #colorLiteral(red: 0.130880475, green: 0.1483016014, blue: 0.1788249612, alpha: 1)
    }
    
    func hideErrorMessage() {
        errorLabel.isHidden = true
    }
    
    func useErrorLabel(_ text: String) {
        errorLabel.isHidden = false
        errorLabel.text = text
        textField.layer.borderColor = #colorLiteral(red: 0.7943204045, green: 0.3077791929, blue: 0.3079556227, alpha: 1)
    }
}
