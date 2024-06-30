//
//  UserInfo.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 04.06.2024.
//

struct UserInfo: Codable {

    private enum CodingKeys: String, CodingKey {
        case urlRepositories = "repos_url"
    }
    var urlRepositories: String
}
