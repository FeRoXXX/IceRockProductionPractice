//
//  StatsView.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 27.06.2024.
//

import UIKit

final class StatsView: UIView {
    
    @IBOutlet private weak var starsLabel: UILabel!
    @IBOutlet private weak var forksLabel: UILabel!
    @IBOutlet private weak var watchersLabel: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupStats(_ stats: RepositoryStatsModel) {
        starsLabel.text = stats.stars
        forksLabel.text = stats.forks
        watchersLabel.text = stats.watchers
    }
}

private extension StatsView {
    
    func setupView() {
        let subview = loadViewFromXib()
        self.addSubview(subview)
    }
    
    func loadViewFromXib() -> UIView {
        guard let bundle = Bundle.main.loadNibNamed("StatsView", owner: self)?.first as? UIView else { return UIView() }
        return bundle
    }
}
