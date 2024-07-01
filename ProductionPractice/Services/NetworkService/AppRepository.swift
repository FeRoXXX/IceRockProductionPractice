//
//  AppRepository.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 04.06.2024.
//

import Alamofire

final class AppRepository {
    
    private let keyValueStorage: IKeyValueStorage = KeyValueStorage()
    
    func getRepositories(url: String, completion: @escaping (Array<Repo>?, Error?) -> Void) {
        
        //let mockURL = "https://api.github.com/users/icerockdev/repos"
        AF.request(url, method: .get) {$0.timeoutInterval = 10}.validate().responseDecodable(of: Array<Repo>.self) { response in
            switch response.result {
            case .success(let data):
                completion(Array(data.prefix(10)), nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func getRepository(repoId: String, completion: @escaping (RepoDetails?, Error?) -> Void) {
        let url = MockData.AppRepositoryService.baseURL.rawValue + "repositories/\(repoId)"
        
        AF.request(url, method: .get) {$0.timeoutInterval = 10}.validate().responseDecodable(of: RepoDetails.self) { response in
            switch response.result {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func getRepositoryReadme(ownerName: String, repositoryName: String, branchName: String, completion: @escaping (String?, Error?) -> Void) {
        let url = "https://raw.githubusercontent.com/\(ownerName)/\(repositoryName)/\(branchName)/README.md"
        AF.request(url, method: .get) {$0.timeoutInterval = 10}.validate().responseString { response in
            switch response.result {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func signIn(token: String, completion: @escaping (UserInfo?, Error?) -> Void) {
        let headers: HTTPHeaders = ["Authorization": "Bearer \(token)","Accept": "application/json"]
        let url = MockData.AppRepositoryService.baseURL.rawValue + "user"
        
        AF.request(url, method: .get, headers: headers) {$0.timeoutInterval = 10}.validate().responseDecodable(of: UserInfo.self) { [weak self] response in
            switch response.result {
            case .success(let data):
                self?.keyValueStorage.saveAuthToken(token: token)
                completion(data, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func logOut() {
        keyValueStorage.deleteAuthToken()
    }
}
