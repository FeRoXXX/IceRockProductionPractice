//
//  URLView.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 26.06.2024.
//

import UIKit

final class URLView: UIView {
    
    @IBOutlet private weak var urlLabel: UILabel!
    var urlTapped: ((String?) -> Void)?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupURLGesture()
    }
    
    func setupURL(_ url: String) {
        urlLabel.text = url
    }
}

private extension URLView {
    
    func setupURLGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(textTapped))
        self.addGestureRecognizer(gesture)
    }
    
    func setupView() {
        let subview = loadViewFromXib()
        self.addSubview(subview)
    }
    
    func loadViewFromXib() -> UIView {
        guard let bundle = Bundle.main.loadNibNamed("URLView", owner: self)?.first as? UIView else { return UIView() }
        return bundle
    }
    
    @objc func textTapped() {
        urlTapped?(urlLabel.text)
    }
}
