//
//  LinksModel.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 05/08/24.
//

import Foundation

struct LinksModel: Codable {
    let selfLink: LinkModel?
    let html: LinkModel?
    let issue: LinkModel?
    let comments: LinkModel?
    let reviewComments: LinkModel?
    let reviewComment: LinkModel?
    let commits: LinkModel?
    let statuses: LinkModel?
    
    enum CodingKeys: String, CodingKey {
        case selfLink = "self"
        case html
        case issue
        case comments
        case reviewComments = "review_comments"
        case reviewComment = "review_comment"
        case commits
        case statuses
    }
}
