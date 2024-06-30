//
//  Repo.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 05.06.2024.
//

import Foundation

struct Repo: Codable {
    let id: Int
    let name: String
    let description: String?
    let language: String?
    let owner: Owner
    
    struct Owner: Codable {
        var login: String
    }
}
