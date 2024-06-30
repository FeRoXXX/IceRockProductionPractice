//
//  LicenseView.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 27.06.2024.
//

import UIKit

final class LicenseView: UIView {
    
    @IBOutlet private weak var licenseLabel: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupLicense(_ license: String?) {
        licenseLabel.text = license
    }
}

private extension LicenseView {
    
    func setupView() {
        let subview = loadViewFromXib()
        self.addSubview(subview)
    }
    
    func loadViewFromXib() -> UIView {
        guard let bundle = Bundle.main.loadNibNamed("LicenseView", owner: self)?.first as? UIView else { return UIView() }
        return bundle
    }
}