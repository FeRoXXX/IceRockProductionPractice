//
//  RepositoriesListViewController.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 30.05.2024.
//

import UIKit

typealias RepositoriesListControllerProtocol = IRepositoriesListView & RepositoriesListTableViewDelegate

final class RepositoriesListViewController: UIViewController {
    
    @IBOutlet private weak var navigationBar: CustomNavigationBar!
    @IBOutlet private weak var alertView: AlertView!
    @IBOutlet private weak var componentView: RepositoriesListView!
    
    private let presenter: IRepositoriesListPresenter
    private let router: IRepositoriesListRouter
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupConstraints()
        setupAlertButton()
        
        router.setupUI(self)
        presenter.viewLoaded(ui: self)
    }
    
    init(presenter: IRepositoriesListPresenter, router: IRepositoriesListRouter) {
        self.presenter = presenter
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension RepositoriesListViewController {
    
    func setupAlertButton() {
        alertView.buttonTapped = { [weak self] in
            self?.presenter.refreshButtonTapped()
        }
    }
    
    func setupNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        navigationBar.quitButtonTriggered = { [weak self] in
            self?.presenter.logOutButtonAction()
        }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            alertView.mainView.topAnchor.constraint(equalTo: alertView.topAnchor),
            alertView.mainView.bottomAnchor.constraint(equalTo: alertView.bottomAnchor),
            alertView.mainView.leadingAnchor.constraint(equalTo: alertView.leadingAnchor),
            alertView.mainView.trailingAnchor.constraint(equalTo: alertView.trailingAnchor)
        ])
    }
}

extension RepositoriesListViewController: RepositoriesListControllerProtocol {
    
    func setupDataSource(dataSource: IRepositoriesListTableViewDataSource) {
        componentView.setupDataSource(dataSource: dataSource)
    }
    
    func setupDelegate() {
        componentView.setupDelegate(delegate: self)
    }
    
    func updateTable() {
        componentView.updateTable()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.cellIsSelected(indexPath.row)
    }
    
    func goToDetail() {
        router.routeToRepositoryDetail()
    }
    
    func goToFirstView() {
        router.routeToFirstViewController()
    }
    
    func setupError(_ error: MockData.Alerts) {
        componentView.isHidden = true
        alertView.isHidden = false
        alertView.setupElements(error)
    }
    
    func startLoading() {
        componentView.isHidden = true
        alertView.startLoading()
    }
    
    func stopLoading() {
        componentView.isHidden = false
        alertView.stopLoading()
    }
    
    func hideAlert() {
        alertView.isHidden = true
        componentView.isHidden = false
    }
}
