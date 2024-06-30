//
//  NetworkReachabilityService.swift
//  ProductionPractice
//
//  Created by Александр Федоткин on 30.06.2024.
//

import Reachability

final class NetworkReachabilityService {
    
    static let shared = NetworkReachabilityService()
    
    private var internetConnection = try! Reachability()
    
    func checkInternetConnection(success: @escaping () -> Void, failure: @escaping () -> Void) {
        try? internetConnection.startNotifier()
        if internetConnection.connection == .wifi || internetConnection.connection == .cellular {
            internetConnection.stopNotifier()
            success()
        } else {
            internetConnection.stopNotifier()
            failure()
        }
    }
}
