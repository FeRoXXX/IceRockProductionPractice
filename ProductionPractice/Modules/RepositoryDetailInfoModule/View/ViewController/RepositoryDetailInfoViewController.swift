//
//  RepositoryDetailInfoViewController.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 26.06.2024.
//

import UIKit
import MarkdownView

final class RepositoryDetailInfoViewController: UIViewController {
    
    @IBOutlet private weak var navigationBar: CustomNavigationBar!
    @IBOutlet private weak var firstInfoView: CustomFirstInfoView!
    @IBOutlet private weak var readmeWebView: MarkdownView!
    @IBOutlet private weak var globalAlertView: AlertView!
    @IBOutlet private weak var readmeAlertView: AlertView!
    
    private let presenter: IRepositoryDetailInfoPresenter
    private let router: IRepositoryDetailInfoRouter

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBarButtons()
        setupConstraints()
        setupAlertsButton()
        
        router.setupRouter(self)
        presenter.viewLoaded(self)
    }
    
    init(presenter: IRepositoryDetailInfoPresenter, router: IRepositoryDetailInfoRouter) {
        self.presenter = presenter
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension RepositoryDetailInfoViewController {
    
    func setupNavigationBarButtons() {
        navigationBar.showBackButton()
        navigationBar.backButtonTriggered = { [unowned self] in
            presenter.backButtonAction()
        }
        
        navigationBar.quitButtonTriggered = { [unowned self] in
            presenter.logOutButtonAction()
        }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            globalAlertView.mainView.topAnchor.constraint(equalTo: globalAlertView.topAnchor),
            globalAlertView.mainView.bottomAnchor.constraint(equalTo: globalAlertView.bottomAnchor),
            globalAlertView.mainView.leadingAnchor.constraint(equalTo: globalAlertView.leadingAnchor),
            globalAlertView.mainView.trailingAnchor.constraint(equalTo: globalAlertView.trailingAnchor),
            readmeAlertView.mainView.topAnchor.constraint(equalTo: readmeAlertView.topAnchor),
            readmeAlertView.mainView.bottomAnchor.constraint(equalTo: readmeAlertView.bottomAnchor),
            readmeAlertView.mainView.leadingAnchor.constraint(equalTo: readmeAlertView.leadingAnchor),
            readmeAlertView.mainView.trailingAnchor.constraint(equalTo: readmeAlertView.trailingAnchor)
        ])
    }
    
    func setupAlertsButton() {
        globalAlertView.buttonTapped = { [unowned self] in
            presenter.globalAlertButtonTapped()
        }
        
        readmeAlertView.buttonTapped = { [unowned self] in
            presenter.readmeAlertButtonTapped()
        }
    }
}

extension RepositoryDetailInfoViewController: IRepositoryDetailInfoViewController {
    
    func goToAuth() {
        router.routToFirstViewController()
    }
    
    func goToRepositoriesList() {
        router.routToRepositoryListViewController()
    }
    
    func setupFirstInfo(_ firstInfo: FirstInfoModel) {
        firstInfoView.setupURLLabel(firstInfo.githubUrlRepo)
        firstInfoView.setupLicenseLabel(firstInfo.license)
        firstInfoView.setupStatsLabel(firstInfo.stats)
    }
    
    func setupReadme(_ markdown: String) {
        let css = ["body { color:white; }"].joined(separator: "\n")
        readmeWebView.load(markdown: markdown, css: css)
    }
    
    func setupError(_ error: MockData.Alerts) {
        firstInfoView.isHidden = true
        readmeWebView.isHidden = true
        globalAlertView.isHidden = false
        globalAlertView.setupElements(error)
    }
    
    func setupReadMeError(_ error: MockData.Alerts) {
        readmeWebView.isHidden = true
        readmeAlertView.isHidden = false
        readmeAlertView.setupElements(error)
    }
    
    func hideAlert() {
        firstInfoView.isHidden = false
        readmeWebView.isHidden = false
        globalAlertView.isHidden = true
        readmeAlertView.isHidden = true
    }
    
    func startLoadingGlobal() {
        firstInfoView.isHidden = true
        readmeWebView.isHidden = true
        globalAlertView.isHidden = false
        globalAlertView.startLoading()
    }
    
    func stopLoadingGlobal() {
        globalAlertView.stopLoading()
        firstInfoView.isHidden = false
        readmeWebView.isHidden = false
        globalAlertView.isHidden = true
        readmeAlertView.isHidden = true
    }
    
    func startLoadingReadMe() {
        readmeWebView.isHidden = true
        readmeAlertView.isHidden = false
        readmeAlertView.startLoading()
    }
    
    func stopLoadingReadMe() {
        readmeAlertView.stopLoading()
        readmeWebView.isHidden = false
        readmeAlertView.isHidden = true
    }
    
    func setupTitle(_ text: String) {
        navigationBar.setupRepositoryName(text)
    }
}
