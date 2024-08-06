//
//  HomeRepoViewModel.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 03/08/24.
//

import Foundation
import UIKit

// MARK: - HomeRepoNavigationProtocol - Use in Coordinator
protocol HomeRepoNavigationProtocol: AnyObject {
    func shouldDetailsRepo(repository: RepositoryModel)
    func shouldError(message: String)
}

// MARK: - ViewModelProtocol - Protocol definition Use in Controller
protocol HomeRepoViewModelProtocol: ViewModelProtocol {
    var isLoading: Observable<Bool> { get }
    var isError: Observable<String?> { get }
    var isPullRefresh: Observable<Bool> { get }
    var searchRepoResult: Observable<SearchRepoResultModel?> { get }
    func setItemListRepoTableViewCell(indexPath: IndexPath) -> ItemListRepoTableViewCell.Configuration
    func shouldDetailsRepo(indexPath: IndexPath)
    func getListRepo(page: Int)
    func loadMoreRepo()
    var hasMoreData: Bool { get }
}

// MARK: - HomeRepoViewModelProtocol
class HomeRepoViewModel: HomeRepoViewModelProtocol {
    private var navigationDelegate: HomeRepoNavigationProtocol
    var isLoading: Observable<Bool>
    var isError: Observable<String?>
    var isPullRefresh: Observable<Bool>
    var searchRepoResult: Observable<SearchRepoResultModel?>
    var currentPage = 1
    var hasMoreData = true
    
    // MARK: - Initialization
    init(navigationDelegate: HomeRepoNavigationProtocol) {
        self.navigationDelegate = navigationDelegate
        self.isLoading = Observable(false)
        self.isPullRefresh = Observable(false)
        self.isError = Observable("")
        self.searchRepoResult = Observable(nil)
        self.getListRepo(page: currentPage)
    }
    
    func getListRepo(page: Int) {
        loadingControl(true)
        let repoWs = RepoWs()
        repoWs.delegate = self
        repoWs.getRepo(page: page)
    }
    
    func loadMoreRepo() {
        guard !isLoading.value && hasMoreData else { return }
        currentPage += 1
        getListRepo(page: currentPage)
    }
    
    func shouldDetailsRepo(indexPath: IndexPath) {
        guard let data = searchRepoResult.value?.items?[indexPath.row] else { return }
        navigationDelegate.shouldDetailsRepo(repository: data)
    }
    
    func loadingControl(_ isHidden: Bool) {
        self.isLoading.value = isHidden
        self.isPullRefresh.value = isHidden
    }
    
    func setItemListRepoTableViewCell(indexPath: IndexPath) -> ItemListRepoTableViewCell.Configuration {
        let data = searchRepoResult.value?.items?[indexPath.row]
        return ItemListRepoTableViewCell.Configuration(cardRepoView: CardRepoView.Configuration(
            titleAndBodyView: TitleAndBodyView.Configuration(
                textTitle: data?.name ?? "",
                textBody: data?.description ?? ""),
            numberForksView: NumbersView.Configuration(
                icon: Images.Icons.ic_forks,
                textNumber: data?.forksCount?.description ?? "0"),
            numberStarsView: NumbersView.Configuration(
                icon: Images.Icons.ic_stars,
                textNumber: data?.stargazersCount?.description ?? "0"),
            profileUserRepoView: ProfileUserRepoView.Configuration(
                userNameText: data?.owner.login ?? "",
                nameText: "",
                avatarURL: URL(string: data?.owner.avatarURL ?? ""))
        ))
    }
}

extension HomeRepoViewModel: WsDelegate {
    func wsFinishedWithSuccess(identifier: Identifiers, sender: NSDictionary, status: WsStatus, jsonResult: NSMutableArray) {
        loadingControl(false)
        if identifier == .listRepo && status == .success {
            guard let senderDict = sender as? [String: Any] else {
                navigationDelegate.shouldError(message: "O sender não é um dicionário válido.")
                return
            }
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: senderDict, options: [])
                let searchRepoResultJson = try JSONDecoder().decode(SearchRepoResultModel.self, from: jsonData)
                if let newItems = searchRepoResultJson.items, !newItems.isEmpty {
                    if var currentResult = self.searchRepoResult.value {
                        currentResult.items?.append(contentsOf: newItems)
                        self.searchRepoResult.value = currentResult
                    } else {
                        self.searchRepoResult.value = searchRepoResultJson
                    }
                } else {
                    self.hasMoreData = false
                }
            } catch {
                navigationDelegate.shouldError(message: "Erro ao converter JSON ou decodificar: \(error)")
            }
        }
    }
    
    func wsFinishedWithError(identifier: Identifiers, sender: NSDictionary, error: String, status: WsStatus, code: Int) {
        loadingControl(false)
        self.hasMoreData = false
        navigationDelegate.shouldError(message: "\(error)")
    }
}
