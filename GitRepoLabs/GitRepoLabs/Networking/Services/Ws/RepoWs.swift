//
//  RepoWs.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 05/08/24.
//

import Foundation

class RepoWs: WebService {
    
    override init() {
        super.init()
    }
    
    // MARK: - Lista de repositórios
    // get -> https://api.github.com/search/repositories?q=language:Swift&sort=stars&page=1
    func getRepo(q: String = "language:Swift", sort: String = "stars", page: Int = 1) {
        super.identifier = .listRepo
        super.get(url: "\(API.baseURL())search/repositories?q=\(q)&sort=\(sort)&page=\(page)")
    }
    
    // MARK: - Pull Requests de um repositório
    // get -> https://api.github.com/repos/<criador>/<repositório>/pulls
    func getPullRequestsRepo(criador: String, repo: String) {
        super.identifier = .listPullRequest
        super.get(url: "\(API.baseURL())repos/\(criador)/\(repo)/pulls")
    }
    
    // MARK: - Obter dados do Usuário
    // get -> https://api.github.com/users/<login>
    func getUser(login: String) {
        super.identifier = .user
        super.get(url: "\(API.baseURL())users/\(login)")
    }
}
