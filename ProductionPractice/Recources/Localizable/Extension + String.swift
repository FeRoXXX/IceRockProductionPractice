//
//  Extension + String.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 01.07.2024.
//

import Foundation

extension String {
    func localized() -> String {
        NSLocalizedString(self, tableName: "Localizable", bundle: .main, value: self, comment: self)
    }
}
