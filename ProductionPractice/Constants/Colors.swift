//
//  Colors.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 30.05.2024.
//

import UIKit

enum Colors {
    
    enum CustomTokenInput {
        static let borderColorSelected = #colorLiteral(red: 0.3449212611, green: 0.6503628492, blue: 0.9986084104, alpha: 1)
        static let borderColorError = #colorLiteral(red: 0.7943204045, green: 0.3077791929, blue: 0.3079556227, alpha: 1)
        static let placeholderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)
    }
    
    enum AlertsColor {
        static let fatalError = #colorLiteral(red: 0.8417338729, green: 0.3985319436, blue: 0.3816541433, alpha: 1)
        static let warning = #colorLiteral(red: 0.4101545811, green: 0.7174265981, blue: 1, alpha: 1)
        
        static func getAlertsColor(by error: MockData.Alerts) -> UIColor {
            switch error {
            case .connectionError, .loadError, .somethingError:
                fatalError
            case .emptyError, .emptyReadme:
                warning
            }
        }
    }
    
    enum LanguageColors: String {
        case swift = "Swift"
        case baseC = "C"
        case cPlusPlus = "C++"
        case cSharp = "C#"
        case kotlin = "Kotlin"
        case java = "Java"
        case python = "Python"
        case html = "HTML"
        case javaScript = "JavaScript"
        
        var color: UIColor {
            switch self {
            case .swift:
                #colorLiteral(red: 1, green: 0.6760933399, blue: 0.2729836106, alpha: 1)
            case .baseC, .cPlusPlus, .cSharp:
                #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
            case .kotlin:
                #colorLiteral(red: 0.9430684447, green: 0.5580074191, blue: 0.20017156, alpha: 1)
            case .java:
                #colorLiteral(red: 0.6896252036, green: 0.4480988979, blue: 0.09757787734, alpha: 1)
            case .python:
                #colorLiteral(red: 0.2082723677, green: 0.4486870766, blue: 0.6478357315, alpha: 1)
            case .html:
                #colorLiteral(red: 0.89014256, green: 0.2978732288, blue: 0.1471491754, alpha: 1)
            case .javaScript:
                #colorLiteral(red: 0.9443149567, green: 0.8801144958, blue: 0.3525030613, alpha: 1)
            }
        }
    }
}
