//
//  LinkModel.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 05/08/24.
//

import Foundation

struct LinkModel: Codable {
    let href: String
    
    enum CodingKeys: String, CodingKey {
        case href
    }
}
