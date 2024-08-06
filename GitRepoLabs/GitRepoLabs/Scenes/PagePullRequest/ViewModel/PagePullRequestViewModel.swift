//
//  PagePullRequestViewModel.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 05/08/24.
//

import Foundation
import UIKit
import WebKit

// MARK: - PagePullRequestNavigationProtocol - Use in Coordinator
protocol PagePullRequestNavigationProtocol: AnyObject {
    
}

// MARK: - ViewModelProtocol - Protocol definition Use in Controller
protocol PagePullRequestViewModelProtocol: ViewModelProtocol {
    var isLoading: Observable<Bool> { get }
    var isError: Observable<String?> { get }
    var urlString: String? { get }
    func getWKWebViewConfiguration() -> WKWebViewConfiguration
}

// MARK: - PagePullRequestViewModelProtocol
class PagePullRequestViewModel: PagePullRequestViewModelProtocol {
    private var navigationDelegate: PagePullRequestNavigationProtocol
    var isLoading: Observable<Bool>
    var isError: Observable<String?>
    var urlString: String?
    
    // MARK: - Initialization
    init(navigationDelegate: PagePullRequestNavigationProtocol, urlString: String) {
        self.navigationDelegate = navigationDelegate
        self.isLoading = Observable(false)
        self.isError = Observable("")
        self.urlString = urlString
    }
    
    func getWKWebViewConfiguration() -> WKWebViewConfiguration {
        let processPool = WKProcessPool()
        let dataStore = WKWebsiteDataStore.default()
        
        let preferences = WKWebpagePreferences()
        preferences.allowsContentJavaScript = true
        
        let userController = WKUserContentController()
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = userController
        configuration.defaultWebpagePreferences = preferences
        configuration.processPool = processPool
        configuration.websiteDataStore = dataStore
        return configuration
    }
    
    func loadingControl(_ isHidden: Bool) {
        self.isLoading.value = isHidden
    }
}
