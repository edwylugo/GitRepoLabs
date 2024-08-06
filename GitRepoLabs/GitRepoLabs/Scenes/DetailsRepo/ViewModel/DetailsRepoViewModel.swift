//
//  DetailsRepoViewModel.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 03/08/24.
//

import Foundation
import UIKit

// MARK: - DetailsRepoNavigationProtocol - Use in Coordinator
protocol DetailsRepoNavigationProtocol: AnyObject {
    func shouldPageRequestPull(urlString: String)
}

// MARK: - ViewModelProtocol - Protocol definition Use in Controller
protocol DetailsRepoViewModelProtocol: ViewModelProtocol {
    var isLoading: Observable<Bool> { get }
    var isError: Observable<String?> { get }
    func setCardPullRequestView(indexPath: IndexPath) -> CardPullRequestView.Configuration
    func setHeaderPullsView() -> HeaderPullsView.Configuration
    func shouldPageRequestPull(indexPath: IndexPath)
    var pullRequestModel: Observable<[PullRequestModel]> { get }
}

// MARK: - DetailsRepoViewModelProtocol
class DetailsRepoViewModel: DetailsRepoViewModelProtocol {
    private var navigationDelegate: DetailsRepoNavigationProtocol
    var isLoading: Observable<Bool>
    var isError: Observable<String?>
    var pullRequestModel: Observable<[PullRequestModel]>
    
    // MARK: - Initialization
    init(navigationDelegate: DetailsRepoNavigationProtocol, repository: RepositoryModel) {
        self.navigationDelegate = navigationDelegate
        self.isLoading = Observable(false)
        self.isError = Observable("")
        self.pullRequestModel = Observable([])
        self.getPullRequestsRepo(criador: repository.owner.login, repo: repository.name)
    }
    
    func getPullRequestsRepo(criador: String, repo: String) {
        loadingControl(true)
        let repoWs = RepoWs()
        repoWs.delegate = self
        repoWs.getPullRequestsRepo(criador: criador, repo: repo)
    }
    
    func setCardPullRequestView(indexPath: IndexPath) -> CardPullRequestView.Configuration {
        let data = pullRequestModel.value[indexPath.row]
        return CardPullRequestView.Configuration(
            titleAndBodyView: TitleAndBodyView.Configuration(
                textTitle: data.title ?? "",
                textBody: data.body ?? ""),
            profileUserPullRequestView: ProfileUserPullRequestView.Configuration(
                profileIcon: Images.Icons.ic_profile,
                userNameText: data.user?.login ?? "",
                nameText: data.user?.type ?? "")
        )
    }
    
    func setHeaderPullsView() -> HeaderPullsView.Configuration {
        return HeaderPullsView.Configuration(
            openedText: "16",
            closedText: "800"
        )
    }
    
    func shouldPageRequestPull(indexPath: IndexPath) {
        let data = pullRequestModel.value[indexPath.row]
        navigationDelegate.shouldPageRequestPull(urlString: data.htmlUrl ?? "")
    }
    
    func loadingControl(_ isHidden: Bool) {
        self.isLoading.value = isHidden
    }
}

extension DetailsRepoViewModel: WsDelegate {
    func wsFinishedWithSuccess(identifier: Identifiers, sender: NSDictionary, status: WsStatus, jsonResult: NSMutableArray) {
        loadingControl(false)
        if identifier == .listPullRequest && status == .success {
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: jsonResult, options: [])
                let pullRequestModelJson = try JSONDecoder().decode([PullRequestModel].self, from: jsonData)
                self.pullRequestModel.value = pullRequestModelJson
            } catch {
                print("Erro ao converter JSON ou decodificar: \(error)")
            }
        }
    }
    
    func wsFinishedWithError(identifier: Identifiers, sender: NSDictionary, error: String, status: WsStatus, code: Int) {
        loadingControl(false)
    }
    
    
}
