//
//  BaseModel.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 05/08/24.
//

import Foundation

struct BaseModel: Codable {
    let label: String
    let ref: String
    let sha: String
    let user: UserModel
    let repo: RepositoryModel
    
    enum CodingKeys: String, CodingKey {
        case label
        case ref
        case sha
        case user
        case repo
    }
}
