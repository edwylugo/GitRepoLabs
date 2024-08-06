//
//  LabelsModel.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 06/08/24.
//

import Foundation

struct LabelsModel: Codable {
    let id: Int?
    let nodeId: String?
    let url: String?
    let name: String?
    let color: String?
    let `default`: Bool?
    let description: String?

    enum CodingKeys: String, CodingKey {
        case id
        case nodeId = "node_id"
        case url
        case name
        case color
        case `default`
        case description
    }
}
