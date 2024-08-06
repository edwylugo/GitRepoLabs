//
//  LicenseModel.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 06/08/24.
//

import Foundation

struct LicenseModel: Codable {
    let key: String?
    let name: String?
    let spdxID: String?
    let url: String?
    let nodeID: String?
    
    enum CodingKeys: String, CodingKey {
        case key
        case name
        case spdxID = "spdx_id"
        case url
        case nodeID = "node_id"
    }
}
