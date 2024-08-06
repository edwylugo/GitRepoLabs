//
//  ItemListRepoTableViewCell.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 03/08/24.
//

import UIKit

// MARK: - UITableViewCell
class ItemListRepoTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    private let viewBackground = UIView().apply {
        $0.backgroundColor = .clear
    }
    
    private let cardRepoView = CardRepoView(translateMask: false)
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
extension ItemListRepoTableViewCell: CodeView {
    func buildViewHierarchy() {
        contentView.addSubview(cardRepoView)
        contentView.addSubview(separatorView)
    }
    
    func setupConstraints() {
        cardRepoView.anchor(top: contentView.topAnchor, paddingTop: 8,
                            leading: contentView.leadingAnchor, paddingLeft: 16,
                            bottom: separatorView.topAnchor, paddingBottom: 16,
                            trailing: contentView.trailingAnchor, paddingRight: 16)
        
        separatorView.anchor(leading: contentView.leadingAnchor, paddingLeft: 16,
                             bottom: contentView.bottomAnchor, paddingBottom: 8,
                             trailing: contentView.trailingAnchor)
    }
    
    func setupAdditionalConfiguration() {
        contentView.backgroundColor = .clear
        selectedBackgroundView = viewBackground
    }
}

// MARK: - Configurable
extension ItemListRepoTableViewCell: Configurable {
    typealias Configuration = ItemListRepoTableViewCellContent
    
    struct ItemListRepoTableViewCellContent {
        let cardRepoView: CardRepoView.Configuration
        
        init(cardRepoView: CardRepoView.Configuration) {
            self.cardRepoView = cardRepoView
        }
    }
    
    func configure(content: ItemListRepoTableViewCellContent) {
        cardRepoView.configure(content: content.cardRepoView)
    }
}
