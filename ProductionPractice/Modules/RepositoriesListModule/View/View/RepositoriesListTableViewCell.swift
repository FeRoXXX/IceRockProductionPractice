//
//  RepositoriesListTableViewCell.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 05.06.2024.
//

import UIKit

final class RepositoriesListTableViewCell: UITableViewCell {

    @IBOutlet private weak var repositoryNameLabel: UILabel!
    @IBOutlet private weak var languageLabel: UILabel!
    @IBOutlet private weak var repositoryDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension RepositoriesListTableViewCell {
    
    func setupData(model: RepositoryDescriptionModel) {
        repositoryNameLabel.text = model.name
        languageLabel.text = model.language
        if let language = model.language {
            languageLabel.textColor = Colors.LanguageColors(rawValue: language)?.color ?? .white
        }
        repositoryDescriptionLabel.text = model.description
    }
}
