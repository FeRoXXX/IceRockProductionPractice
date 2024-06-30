//
//  RepoDetails.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 28.06.2024.
//

import Foundation

struct RepoDetails: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case name
        case branch = "default_branch"
        case githubUrlRepo = "html_url"
        case license
        case stargazers = "stargazers_count"
        case watchers = "watchers_count"
        case forks = "forks_count"
        case owner
    }
    var name: String
    var branch: String
    var githubUrlRepo: String
    var license: License?
    var stargazers: Int
    var forks: Int
    var watchers: Int
    var owner: Owner
}

// MARK: - License
struct License: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case spdx = "spdx_id"
    }
    var spdx: String
}

struct Owner: Codable {
    var login: String
}
