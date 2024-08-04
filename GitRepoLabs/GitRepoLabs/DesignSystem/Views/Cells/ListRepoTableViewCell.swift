//
//  ListRepoTableViewCell.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 03/08/24.
//

import UIKit

// MARK: - UITableViewCell
class ListRepoTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    private let cardRepoView = CardRepoView(translateMask: false)
    
    // MARK: - LifeCycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - CodeView
extension ListRepoTableViewCell: CodeView {
    func buildViewHierarchy() {
        contentView.addSubview(cardRepoView)
    }
    
    func setupConstraints() {
        cardRepoView.anchor(top: contentView.topAnchor,
                                paddingTop: 8,
                                leading: contentView.leadingAnchor,
                                bottom: contentView.bottomAnchor,
                                paddingBottom: 8,
                                trailing: contentView.trailingAnchor)
    }
    
    func setupAdditionalConfiguration() {
        contentView.backgroundColor = .clear
    }
}

// MARK: - Configurable
extension ListRepoTableViewCell: Configurable {
    typealias Configuration = ListRepoTableViewCellContent
    
    struct ListRepoTableViewCellContent {
        let cardRepoView: CardRepoView.Configuration
        
        init(cardRepoView: CardRepoView.Configuration) {
            self.cardRepoView = cardRepoView
        }
    }
    
    func configure(content: ListRepoTableViewCellContent) {
        cardRepoView.configure(content: content.cardRepoView)
    }
}
