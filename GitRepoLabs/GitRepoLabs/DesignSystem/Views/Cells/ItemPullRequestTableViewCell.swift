//
//  ItemPullRequestTableViewCell.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 05/08/24.
//

import UIKit

// MARK: - UITableViewCell
class ItemPullRequestTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    private let viewBackground = UIView().apply {
        $0.backgroundColor = .clear
    }
    
    private let cardPullRequestView = CardPullRequestView(translateMask: false)
    private let separatorView = LineView(translateMask: false)
    
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
extension ItemPullRequestTableViewCell: CodeView {
    func buildViewHierarchy() {
        contentView.addSubview(cardPullRequestView)
        contentView.addSubview(separatorView)
    }
    
    func setupConstraints() {
        cardPullRequestView.anchor(top: contentView.topAnchor, paddingTop: 8,
                            leading: contentView.leadingAnchor, paddingLeft: 16,
                            bottom: separatorView.topAnchor, paddingBottom: 8,
                            trailing: contentView.trailingAnchor, paddingRight: 16)
        
        separatorView.anchor(leading: contentView.leadingAnchor, paddingLeft: 16,
                             bottom: contentView.bottomAnchor,
                             trailing: contentView.trailingAnchor)
    }
    
    func setupAdditionalConfiguration() {
        contentView.backgroundColor = .clear
        selectedBackgroundView = viewBackground
    }
}

// MARK: - Configurable
extension ItemPullRequestTableViewCell: Configurable {
    typealias Configuration = ItemPullRequestTableViewCellContent
    
    struct ItemPullRequestTableViewCellContent {
        let cardPullRequestView: CardPullRequestView.Configuration
        
        init(cardPullRequestView: CardPullRequestView.Configuration) {
            self.cardPullRequestView = cardPullRequestView
        }
    }
    
    func configure(content: ItemPullRequestTableViewCellContent) {
        cardPullRequestView.configure(content: content.cardPullRequestView)
    }
}
