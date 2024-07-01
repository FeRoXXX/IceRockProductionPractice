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
    @IBOutlet private weak var starsTitleLabel: UILabel!
    @IBOutlet private weak var forksTitleLabel: UILabel!
    @IBOutlet private weak var watchersTitleLabel: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupMockText()
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
    
    func setupMockText() {
        starsTitleLabel.text = MockData.StatsViewText.stars.rawValue.localized()
        forksTitleLabel.text = MockData.StatsViewText.forks.rawValue.localized()
        watchersTitleLabel.text = MockData.StatsViewText.watchers.rawValue.localized()
    }
}
