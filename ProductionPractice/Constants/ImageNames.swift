//
//  ImageNames.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 30.06.2024.
//

import Foundation

enum ImageNames {
    
    enum AlertsImage: String {
        case InternetConnection
        case Path
        case Something
        
        static func getImageName(by alert: MockData.Alerts) -> String {
            switch alert {
            case .connectionError, .loadError:
                InternetConnection.rawValue
            case .somethingError:
                Something.rawValue
            case .emptyError, .emptyReadme:
                Path.rawValue
            }
        }
    }
}
