//
//  URLBase.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 05/08/24.
//

import Foundation

struct API {
    static func baseURL() -> String {
        return "https://api.github.com/"
    }
    
    // PERSONAL ACCESS - Expire in 90 days
    static func tokenGit() -> String {
        return "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"
    }
}
