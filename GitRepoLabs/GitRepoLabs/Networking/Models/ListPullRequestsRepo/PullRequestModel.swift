//
//  PullRequestModel.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 05/08/24.
//

import Foundation

struct PullRequest: Codable {
    let url: String
    let id: Int
    let nodeId: String
    let htmlUrl: String
    let diffUrl: String
    let patchUrl: String
    let issueUrl: String
    let number: Int
    let state: String
    let locked: Bool
    let title: String
    let user: UserModel
    let body: String?
    let createdAt: String
    let updatedAt: String
    let closedAt: String?
    let mergedAt: String?
    let mergeCommitSha: String
    let assignee: String?
    let assignees: [String]
    let requestedReviewers: [String]
    let requestedTeams: [String]
    let labels: [String]
    let milestone: String?
    let draft: Bool
    let commitsUrl: String
    let reviewCommentsUrl: String
    let reviewCommentUrl: String
    let commentsUrl: String
    let statusesUrl: String
    let head: HeadModel
    let base: BaseModel
    let links: LinksModel
    let authorAssociation: String
    let autoMerge: String?
    let activeLockReason: String?
    
    enum CodingKeys: String, CodingKey {
        case url
        case id
        case nodeId = "node_id"
        case htmlUrl = "html_url"
        case diffUrl = "diff_url"
        case patchUrl = "patch_url"
        case issueUrl = "issue_url"
        case number
        case state
        case locked
        case title
        case user
        case body
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case closedAt = "closed_at"
        case mergedAt = "merged_at"
        case mergeCommitSha = "merge_commit_sha"
        case assignee
        case assignees
        case requestedReviewers = "requested_reviewers"
        case requestedTeams = "requested_teams"
        case labels
        case milestone
        case draft
        case commitsUrl = "commits_url"
        case reviewCommentsUrl = "review_comments_url"
        case reviewCommentUrl = "review_comment_url"
        case commentsUrl = "comments_url"
        case statusesUrl = "statuses_url"
        case head
        case base
        case links = "_links"
        case authorAssociation = "author_association"
        case autoMerge = "auto_merge"
        case activeLockReason = "active_lock_reason"
    }
}
