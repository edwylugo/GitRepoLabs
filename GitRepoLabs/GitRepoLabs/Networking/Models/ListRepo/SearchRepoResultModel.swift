//
//  SearchRepoResultModel.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 05/08/24.
//

import Foundation

struct SearchRepoResultModel: Codable {
    let totalCount: Int?
    let incompleteResults: Bool?
    var items: [RepositoryModel]?
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}
