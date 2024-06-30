//
//  IAuthPresenter.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 08.06.2024.
//

import Foundation

protocol IAuthPresenter {
    func viewLoaded(ui: IAuthViewController)
    func textFieldIsSelected()
    func userEndEditing(_ text: String?)
    func hideKeyboard()
    func checkAuth(_ token: String?)
}
