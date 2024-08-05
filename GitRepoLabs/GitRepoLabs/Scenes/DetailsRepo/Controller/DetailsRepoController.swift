//
//  DetailsRepoController.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 03/08/24.
//

import UIKit

class DetailsRepoController: UIViewController {
    
    // MARK: - Properties
    private let headerView = HeaderView(translateMask: false)
    
    private let listPullsTableView = UITableView(frame: .zero, style: .grouped).apply {
        $0.separatorStyle = .none
        $0.backgroundColor = .white
        $0.allowsSelection = true
        $0.bounces = true
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private var viewModel: DetailsRepoViewModelProtocol
    
    // MARK: - LifeCycle
    
    init(viewModel: DetailsRepoViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        registerCells()
        setupDelegates()
        setupBindigs()
    }
    
    // MARK: - Methods
    
    func registerCells() {
        listPullsTableView.register(cellClass: ItemPullRequestTableViewCell.self)
    }
    
    func setupDelegates() {
        headerView.delegate = self
        listPullsTableView.delegate = self
        listPullsTableView.dataSource = self
    }
    
    func setupBindigs() {
        listPullsTableView.reloadData()
    }
}

// MARK: - CodeView
extension DetailsRepoController: CodeView {
    func buildViewHierarchy() {
        view.addSubview(headerView)
        view.addSubview(listPullsTableView)
    }
    
    func setupConstraints() {
        headerView.anchor(top: view.topAnchor, paddingTop: 24,
                          leading: view.leadingAnchor, paddingLeft: 8,
                          trailing: view.trailingAnchor, paddingRight: 8)
        
        listPullsTableView.anchor(top: headerView.bottomAnchor, paddingTop: 16,
                                  leading: view.leadingAnchor,
                                  bottom: view.bottomAnchor,
                                  trailing: view.trailingAnchor)
    }
    
    func setupAdditionalConfiguration() {
        view.backgroundColor = .darkGray
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension DetailsRepoController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cellClass: ItemPullRequestTableViewCell.self, indexPath: indexPath)
        cell.configure(
            content: ItemPullRequestTableViewCell.Configuration(
                cardPullRequestView: viewModel.setCardPullRequestView()
            )
        )
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.shouldPageRequestPull()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HeaderPullsView()
        headerView.configure(content: viewModel.setHeaderPullsView())
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - HeaderViewDelegate
extension DetailsRepoController: HeaderViewDelegate {
    func leftButtonAction() {
        navigationController?.popViewController(animated: true)
    }
}
