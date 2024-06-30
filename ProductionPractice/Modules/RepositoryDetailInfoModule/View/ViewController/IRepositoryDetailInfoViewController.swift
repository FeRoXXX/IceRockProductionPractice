//
//  IRepositoryDetailInfoViewController.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 28.06.2024.
//

import Foundation

protocol IRepositoryDetailInfoViewController: AnyObject {
    func goToAuth()
    func goToRepositoriesList()
    func setupFirstInfo(_ firstInfo: FirstInfoModel)
    func setupReadme(_ markdown: String)
    func setupError(_ error: MockData.Alerts)
    func setupReadMeError(_ error: MockData.Alerts)
    func hideAlert()
    func startLoadingGlobal()
    func stopLoadingGlobal()
    func startLoadingReadMe()
    func stopLoadingReadMe()
    func setupTitle(_ text: String)
}
