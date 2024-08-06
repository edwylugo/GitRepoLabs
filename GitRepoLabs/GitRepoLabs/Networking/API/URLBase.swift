//
//  URLBase.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 05/08/24.
//

import Foundation

struct API {
    
    private static let environmentFile = Bundle.main.path(forResource: "environment", ofType: "plist")
    
    static func baseURL() -> String {
        return loadEnvironmentDictionary()?["BaseUrl"] as? String ?? ""
    }
    
    // PERSONAL ACCESS - Expire in 90 days
    static func tokenGit() -> String {
        return loadEnvironmentDictionary()?["PersonalToken"] as? String ?? ""
    }
    
    private static func loadEnvironmentDictionary() -> [String: Any]? {
        guard let environmentFile = environmentFile,
              let environmentDictionary = NSDictionary(contentsOfFile: environmentFile) as? [String: Any] else {
            return nil
        }
        return environmentDictionary
    }
}
