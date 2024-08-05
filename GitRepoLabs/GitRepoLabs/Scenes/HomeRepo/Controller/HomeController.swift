//
//  HomeController.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 03/08/24.
//

import UIKit

class HomeRepoController: UIViewController {
    
    // MARK: - Properties
    private let listRepoTableView = UITableView(translateMask: false).apply {
        $0.separatorStyle = .none
        $0.backgroundColor = .white
        $0.allowsSelection = true
        $0.bounces = true
        $0.isUserInteractionEnabled = true
    }
    
    private var viewModel: HomeRepoViewModelProtocol
    
    // MARK: - LifeCycle
    
    init(viewModel: HomeRepoViewModelProtocol) {
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
        listRepoTableView.register(cellClass: ItemListRepoTableViewCell.self)
    }
    
    func setupDelegates() {
        listRepoTableView.delegate = self
        listRepoTableView.dataSource = self
    }
    
    func setupBindigs() {
        listRepoTableView.reloadData()
    }
    
}

// MARK: - CodeView
extension HomeRepoController: CodeView {
    func buildViewHierarchy() {
        view.addSubview(listRepoTableView)
    }
    
    func setupConstraints() {
        listRepoTableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 16,
                                 leading: view.leadingAnchor,
                                 bottom: view.bottomAnchor,
                                 trailing: view.trailingAnchor)
    }
    
    func setupAdditionalConfiguration() {
        view.backgroundColor = .white
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension HomeRepoController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cellClass: ItemListRepoTableViewCell.self, indexPath: indexPath)
        cell.configure(content: ItemListRepoTableViewCell.Configuration(cardRepoView: viewModel.setCardRepoView()))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.shouldDetailsRepo()
    }
}
