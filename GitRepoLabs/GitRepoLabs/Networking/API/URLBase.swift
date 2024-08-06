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
        if let environmentFile = environmentFile {
            if let environmentDictionary = NSDictionary(contentsOfFile: environmentFile) {
                return environmentDictionary["BaseUrl"] as? String ?? ""
            }
        }
        return ""
    }
    
    // PERSONAL ACCESS - Expire in 90 days
    static func tokenGit() -> String {
        if let environmentFile = environmentFile {
            if let environmentDictionary = NSDictionary(contentsOfFile: environmentFile) {
                return environmentDictionary["PersonalToken"] as? String ?? ""
            }
        }
        return ""
    }
}
