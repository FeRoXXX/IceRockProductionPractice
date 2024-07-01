//
//  CustomInputButton.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 08.06.2024.
//

import UIKit
import NVActivityIndicatorView

final class CustomInputButton: UIView {
    
    @IBOutlet private weak var text: UILabel!
    @IBOutlet private weak var activityIndicator: NVActivityIndicatorView!
    
    var buttonClicked: (() -> Void)?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupMockText()
        setupButton()
    }
    
    func startLoading() {
        text.isHidden = true
        activityIndicator.startAnimating()
    }
    
    func stopLoading() {
        text.isHidden = false
        activityIndicator.stopAnimating()
    }
}

private extension CustomInputButton {
    
    func setupView() {
        let subview = loadViewFromXib()
        self.addSubview(subview)
    }
    
    func loadViewFromXib() -> UIView {
        guard let bundle = Bundle.main.loadNibNamed("CustomInputButton", owner: self)?.first as? UIView else { return UIView() }
        return bundle
    }
    
    func setupButton() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(buttonClick))
        addGestureRecognizer(gesture)
    }
    
    func setupMockText() {
        text.text = MockData.CustomInputButtonText.signIn.rawValue.localized()
    }
    
    @objc func buttonClick() {
        buttonClicked?()
    }
}
