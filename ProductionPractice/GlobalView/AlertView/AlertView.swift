//
//  AlertView.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 30.06.2024.
//

import UIKit
import NVActivityIndicatorView

final class AlertView: UIView {
    
    @IBOutlet var mainView: UIView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var textLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var actionButton: UIButton!
    @IBOutlet private weak var loadingIndicator: NVActivityIndicatorView!
    @IBOutlet private weak var emptyReadmeLabel: UILabel!
    
    var buttonTapped: (() -> Void)?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupButtonTarget()
    }
}

extension AlertView {
    
    func setupElements(_ error: MockData.Alerts) {
        switch error {
        case .connectionError, .loadError, .somethingError, .emptyError:
            imageView.image = UIImage(named: ImageNames.AlertsImage.getImageName(by: error))
            textLabel.textColor = Colors.AlertsColor.getAlertsColor(by: error)
            textLabel.text = error.rawValue
            descriptionLabel.text = MockData.Alerts.getDescription(by: error)
            actionButton.setTitle(MockData.AlertButtonText.getText(by: error), for: .normal)
        case .emptyReadme:
            imageView.isHidden = true
            textLabel.isHidden = true
            descriptionLabel.isHidden = true
            actionButton.isHidden = true
            emptyReadmeLabel.isHidden = false
        }
    }
    
    func startLoading() {
        textLabel.isHidden = true
        imageView.isHidden = true
        descriptionLabel.isHidden = true
        actionButton.isHidden = true
        loadingIndicator.isHidden = false
        loadingIndicator.startAnimating()
    }
    
    func stopLoading() {
        loadingIndicator.stopAnimating()
        textLabel.isHidden = false
        imageView.isHidden = false
        descriptionLabel.isHidden = false
        actionButton.isHidden = false
        loadingIndicator.isHidden = true
    }
}

private extension AlertView {
    
    func setupView() {
        let subview = loadViewFromXib()
        self.addSubview(subview)
    }
    
    func loadViewFromXib() -> UIView {
        guard let bundle = Bundle.main.loadNibNamed("AlertView", owner: self)?.first as? UIView else { return UIView() }
        return bundle
    }
    
    func setupButtonTarget() {
        actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
    }
    
    @objc func actionButtonTapped() {
        buttonTapped?()
    }
}
