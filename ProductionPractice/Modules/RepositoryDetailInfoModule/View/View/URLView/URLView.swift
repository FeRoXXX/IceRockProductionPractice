//
//  URLView.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 26.06.2024.
//

import UIKit

final class URLView: UIView {
    
    @IBOutlet private weak var urlLabel: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupURL(_ url: String) {
        urlLabel.text = url
    }
}

private extension URLView {
    
    func setupView() {
        let subview = loadViewFromXib()
        self.addSubview(subview)
    }
    
    func loadViewFromXib() -> UIView {
        guard let bundle = Bundle.main.loadNibNamed("URLView", owner: self)?.first as? UIView else { return UIView() }
        return bundle
    }
}
