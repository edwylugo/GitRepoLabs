//
//  HeaderPullsView.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 05/08/24.
//

import UIKit

class HeaderPullsView: UIView {
    
    // MARK: - Properties
    private let titleLabel = UILabel(translateMask: false).apply {
        $0.font = UIFont.boldSystemFont(ofSize: 16)
        $0.textColor = .black
        $0.textAlignment = .left
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - CodeView
extension HeaderPullsView: CodeView {
    func buildViewHierarchy() {
        addSubview(titleLabel)
    }
    
    func setupConstraints() {
        titleLabel.anchor(top: topAnchor, paddingTop: 16,
                          leading: leadingAnchor, paddingLeft: 16,
                          bottom: bottomAnchor, paddingBottom: 16,
                          trailing: trailingAnchor, paddingRight: 16)
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .systemGray6
    }
}

// MARK: - Configurable -> Populate Data ViewModel
extension HeaderPullsView: Configurable {
    typealias Configuration = HeaderPullsViewContent
    
    struct HeaderPullsViewContent {
        let openedText: String
        let closedText: String
        
        init(openedText: String, closedText: String) {
            self.openedText = openedText
            self.closedText = closedText
        }
    }
    
    func configure(content: HeaderPullsViewContent) {
        titleLabel.setAttributedTextWithColor(
            fullText: "\(content.openedText) opened / \(content.closedText) closed",
            changeText: "\(content.openedText) opened",
            color: .colorGold())
    }
}
