//
//  MockData.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 26.06.2024.
//

import Foundation

enum MockData {
    enum AppRepositoryService: String {
        case baseURL = "https://api.github.com/"
    }
    
    enum Errors: String, Error {
        case invalidToken = "Invalid token"
        case alertMessage = "Error data / error code information for developers"
        case Error
        case Ok
    }
    
    enum Alerts: String {
        case connectionError = "Connection error"
        case loadError = "Load error"
        case somethingError = "Something Error"
        case emptyError = "Empty"
        case emptyReadme = "Empty Readme file"
        
        static func getDescription(by error: Alerts) -> String {
            switch error {
            case .connectionError, .loadError:
                "Check your Internet connection"
            case .somethingError:
                "Check your something"
            case .emptyError:
                "No repositories at the moment"
            case .emptyReadme:
                "Readme doesn't exist try again later"
            }
        }
    }
    
    enum AlertButtonText: String {
        case Retry
        case Refresh
        
        static func getText(by error: Alerts) -> String {
            switch error {
            case .connectionError, .loadError, .somethingError:
                Retry.rawValue
            case .emptyError, .emptyReadme:
                Refresh.rawValue
            }
        }
    }
}
