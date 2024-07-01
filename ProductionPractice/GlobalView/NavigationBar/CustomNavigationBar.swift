//
//  CustomNavigationBar.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 26.06.2024.
//

import UIKit

final class CustomNavigationBar: UIView {
    
    @IBOutlet private weak var quitButton: UIButton!
    @IBOutlet private weak var repositoryName: UILabel!
    @IBOutlet private weak var backButton: UIButton!
    
    var quitButtonTriggered: (() -> Void)?
    var backButtonTriggered: (() -> Void)?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupMockText()
        setupButtonsAction()
    }
    
    func setupRepositoryName(_ text: String) {
        repositoryName.text = text
    }
    
    func showBackButton() {
        backButton.isHidden = false
    }
}

private extension CustomNavigationBar {
    
    func setupView() {
        let subview = loadViewFromXib()
        
        self.addSubview(subview)
    }
    
    func loadViewFromXib() -> UIView {
        guard let bundle = Bundle.main.loadNibNamed("CustomNavigationBar", owner: self)?.first as? UIView else { return UIView() }
        return bundle
    }
    
    func setupButtonsAction() {
        quitButton.addTarget(self, action: #selector(quitButtonClicked), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
    }
    
    func setupMockText() {
        repositoryName.text = MockData.NavigationBarText.repositoriesName.rawValue.localized()
    }
    
    @objc func quitButtonClicked() {
        quitButtonTriggered?()
    }
    
    @objc func backButtonClicked() {
        backButtonTriggered?()
    }
}
