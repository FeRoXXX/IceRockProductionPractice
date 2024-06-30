//
//  IAuthViewController.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 08.06.2024.
//

import Foundation

protocol IAuthViewController: AnyObject {
    func useSelectColor()
    func useUnselectedColor()
    func hideErrorMessage()
    func hideKeyboard()
    func showError(_ text: String)
    func startLoadingIndicator()
    func stopLoadingIndicator()
    func successAuth()
    func showAlert(_ alertText: String)
}
