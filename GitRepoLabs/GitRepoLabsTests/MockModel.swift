//
//  MockModel.swift
//  GitRepoLabsTests
//
//  Created by Edwy Lugo on 06/08/24.
//

import Foundation

let repository = RepositoryModel(id: Int(), nodeID: String(), name: String(), fullName: String(), isPrivate: Bool(), owner: owner, htmlURL: String(), description: String(), fork: Bool(), url: String(), forksURL: String(), keysURL: String(), collaboratorsURL: String(), teamsURL: String(), hooksURL: String(), issueEventsURL: String(), eventsURL: String(), assigneesURL: String(), branchesURL: String(), tagsURL: String(), blobsURL: String(), gitTagsURL: String(), gitRefsURL: String(), treesURL: String(), statusesURL: String(), languagesURL: String(), stargazersURL: String(), contributorsURL: String(), subscribersURL: String(), subscriptionURL: String(), commitsURL: String(), gitCommitsURL: String(), commentsURL: String(), issueCommentURL: String(), contentsURL: String(), compareURL: String(), mergesURL: String(), archiveURL: String(), downloadsURL: String(), issuesURL: String(), pullsURL: String(), milestonesURL: String(), notificationsURL: String(), labelsURL: String(), releasesURL: String(), deploymentsURL: String(), createdAt: String(), updatedAt: String(), pushedAt: String(), gitURL: String(), sshURL: String(), cloneURL: String(), svnURL: String(), homepage: String(), size: Int(), stargazersCount: Int(), watchersCount: Int(), language: String(), hasIssues: Bool(), hasProjects: Bool(), hasDownloads: Bool(), hasWiki: Bool(), hasPages: Bool(), hasDiscussions: Bool(), forksCount: Int(), mirrorURL: String(), archived: Bool(), disabled: Bool(), openIssuesCount: Int(), license: license, allowForking: Bool(), isTemplate: Bool(), webCommitSignoffRequired: Bool(), topics: [], visibility: String(), forks: Int(), openIssues: Int(), watchers: Int(), defaultBranch: String(), score: Double())

let owner = Owner(login: String(), id: Int(), nodeID: String(), avatarURL: String(), gravatarID: String(), url: String(), htmlURL: String(), followersURL: String(), followingURL: String(), gistsURL: String(), starredURL: String(), subscriptionsURL: String(), organizationsURL: String(), reposURL: String(), eventsURL: String(), receivedEventsURL: String(), type: String(), siteAdmin: Bool())

let license = LicenseModel(key: String(), name: String(), spdxID: String(), url: String(), nodeID: String())

let pullRequestModel = PullRequestModel(url: String(), id: Int(), nodeId: String(), htmlUrl: String(), diffUrl: String(), patchUrl: String(), issueUrl: String(), number: Int(), state: String(), locked: Bool(), title: String(), user: userRepoModel, body: String(), createdAt: String(), updatedAt: String(), closedAt: String(), mergedAt: String(), mergeCommitSha: String(), assignee: userRepoModel, assignees: [userRepoModel], requestedReviewers: [userRepoModel], requestedTeams: [String()], labels: [labelsModel], milestone: milestone, draft: Bool(), commitsUrl: String(), reviewCommentsUrl: String(), reviewCommentUrl: String(), commentsUrl: String(), statusesUrl: String(), head: headModel, base: baseModel, links: linksModel, authorAssociation: String(), autoMerge: String(), activeLockReason: String())

let userRepoModel = UserRepoModel(login: String(), id: Int(), nodeId: String(), avatarUrl: String(), gravatarId: String(), url: String(), htmlUrl: String(), followersUrl: String(), followingUrl: String(), gistsUrl: String(), starredUrl: String(), subscriptionsUrl: String(), organizationsUrl: String(), reposUrl: String(), eventsUrl: String(), receivedEventsUrl: String(), type: String(), siteAdmin: Bool())

let labelsModel = LabelsModel(id: Int(), nodeId: String(), url: String(), name: String(), color: String(), default: Bool(), description: String())

let headModel = HeadModel(label: String(), ref: String(), sha: String(), user: userRepoModel, repo: repository)

let milestone = Milestone(url: String(), htmlUrl: String(), labelsUrl: String(), id: Int(), nodeId: String(), number: Int(), title: String(), description: String(), creator: userRepoModel, openIssues: Int(), closedIssues: Int(), state: String(), createdAt: String(), updatedAt: String(), dueOn: String(), closedAt: String())

let baseModel = BaseModel(label: String(), ref: String(), sha: String(), user: userRepoModel, repo: repository)

let linksModel = LinksModel(selfLink: linkModel, html: linkModel, issue: linkModel, comments: linkModel, reviewComments: linkModel, reviewComment: linkModel, commits: linkModel, statuses: linkModel)

let linkModel = LinkModel(href: String())
