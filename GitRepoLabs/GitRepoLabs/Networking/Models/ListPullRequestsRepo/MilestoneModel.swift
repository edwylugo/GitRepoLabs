//
//  MilestoneModel.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 06/08/24.
//

struct Milestone: Codable {
    let url: String?
    let htmlUrl: String?
    let labelsUrl: String?
    let id: Int?
    let nodeId: String?
    let number: Int?
    let title: String?
    let description: String?
    let creator: UserRepoModel
    let openIssues: Int?
    let closedIssues: Int?
    let state: String?
    let createdAt: String?
    let updatedAt: String?
    let dueOn: String?
    let closedAt: String?

    enum CodingKeys: String, CodingKey {
        case url
        case htmlUrl = "html_url"
        case labelsUrl = "labels_url"
        case id
        case nodeId = "node_id"
        case number
        case title
        case description
        case creator
        case openIssues = "open_issues"
        case closedIssues = "closed_issues"
        case state
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case dueOn = "due_on"
        case closedAt = "closed_at"
    }
}
