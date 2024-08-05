//
//  PagePullRequestController.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 05/08/24.
//

import UIKit
import WebKit

class PagePullRequestController: UIViewController {
    
    // MARK: - Properties
    
    private var webView = WKWebView()
    private var viewModel: PagePullRequestViewModelProtocol
    
    // MARK: - LifeCycle
    
    init(viewModel: PagePullRequestViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
        setupViews()
        setupBindigs()
    }
    
    // MARK: - Methods
    
    func setupBindigs() {
        
    }
    
    func setupWebView() {
        webView = WKWebView(frame: view.bounds, configuration: getWKWebViewConfiguration())
        webView.navigationDelegate = self
        
        if let urlString = viewModel.urlString, let url = URL(string: urlString) {
            var request = URLRequest(url: url)
            request.cachePolicy = .returnCacheDataElseLoad
            request.timeoutInterval = 10
            webView.load(request)
            webView.allowsBackForwardNavigationGestures = false
        }
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
}

// MARK: - CodeView
extension PagePullRequestController: CodeView {
    func buildViewHierarchy() {
        view.addSubview(webView)
    }
    
    func setupConstraints() {
        webView.anchor(
            top: view.topAnchor,
            paddingTop: 24,
            leading: view.leadingAnchor,
            paddingLeft: 24,
            bottom: view.bottomAnchor,
            paddingBottom: 24,
            trailing: view.trailingAnchor,
            paddingRight: 24
        )
    }
    
    func setupAdditionalConfiguration() {
        view.backgroundColor = .white
    }
}

// MARK: - WKNavigationDelegate
extension PagePullRequestController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("didStartProvisionalNavigation")
    }
    
    func webView(_ webView: WKWebView, didFailLoadWithError error: Error) {
        print("didFailLoadWithError")
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("didFail")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("didFinish")
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print("didFailProvisionalNavigation")
    }
}
