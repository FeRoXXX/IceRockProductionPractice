//
//  RepositoriesListView.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 30.05.2024.
//

import UIKit

final class RepositoriesListView: UIView {
    
    @IBOutlet private weak var repositoriesTableView: UITableView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
}

private extension RepositoriesListView {
    
    func setupView() {
        let subview = loadViewFromXib()
        repositoriesTableView.register(UINib(nibName: "RepositoriesListTableViewCell", bundle: nil), forCellReuseIdentifier: "RepositoriesListTableViewCell")
        self.addSubview(subview)
    }
    
    func loadViewFromXib() -> UIView {
        guard let bundle = Bundle.main.loadNibNamed("RepositoriesListView", owner: self)?.first as? UIView else { return UIView() }
        return bundle
    }
}

extension RepositoriesListView {
    func setupDataSource(dataSource: IRepositoriesListTableViewDataSource) {
        repositoriesTableView.dataSource = dataSource
    }
    
    func setupDelegate(delegate: RepositoriesListTableViewDelegate) {
        repositoriesTableView.delegate = delegate
    }
    
    func updateTable() {
        repositoriesTableView.reloadData()
    }
}
