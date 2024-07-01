//
//  CustomFirstInfoView.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 26.06.2024.
//

import UIKit

final class CustomFirstInfoView: UIView {
    
    @IBOutlet private weak var urlLabel: URLView!
    @IBOutlet private weak var licenseLabel: LicenseView!
    @IBOutlet private weak var statsLabel: StatsView!
    var urlLinkTapped: ((String?) -> Void)?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupURLClosure()
    }
    
    func setupURLLabel(_ url: String) {
        urlLabel.setupURL(url)
    }
    
    func setupLicenseLabel(_ license: String?) {
        if let license {
            licenseLabel.setupLicense(license)
        }
    }
    
    func setupStatsLabel(_ stats: RepositoryStatsModel) {
        statsLabel.setupStats(stats)
    }
}

private extension CustomFirstInfoView {
    
    func setupView() {
        let subview = loadViewFromXib()
        self.addSubview(subview)
    }
    
    func loadViewFromXib() -> UIView {
        guard let bundle = Bundle.main.loadNibNamed("CustomFirstInfoView", owner: self)?.first as? UIView else { return UIView() }
        return bundle
    }
    
    func setupURLClosure() {
        urlLabel.urlTapped = { [weak self] url in
            self?.urlLinkTapped?(url)
        }
    }
}
