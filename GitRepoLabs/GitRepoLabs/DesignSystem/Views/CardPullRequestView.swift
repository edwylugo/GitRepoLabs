//
//  CardPullRequestView.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 05/08/24.
//

import UIKit

class CardPullRequestView: UIView {
    
    // MARK: - Properties
    
    private let stackView = UIStackView(translateMask: false).apply {
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .leading
        $0.spacing = 8
    }
    
    private let titleAndBodyView = TitleAndBodyView(translateMask: false)
    
    private let profileUserPullRequestView = ProfileUserPullRequestView(translateMask: false)
    
    // MARK: - LifeCycle
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
extension CardPullRequestView: CodeView {
    
    func buildViewHierarchy() {
        addSubview(stackView)
        stackView.addArrangedSubviews([
            titleAndBodyView,
            profileUserPullRequestView
        ])
    }
    
    func setupConstraints() {
        stackView.anchor(top: topAnchor,
                         leading: leadingAnchor,
                         bottom: bottomAnchor,
                         trailing: trailingAnchor)
    }
}

// MARK: - Configurable -> Populate Data ViewModel
extension CardPullRequestView: Configurable {
    typealias Configuration = CardPullRequestViewContent
    
    struct CardPullRequestViewContent {
        let titleAndBodyView: TitleAndBodyView.Configuration
        let profileUserPullRequestView: ProfileUserPullRequestView.Configuration
        
        init(titleAndBodyView: TitleAndBodyView.Configuration,
             profileUserPullRequestView: ProfileUserPullRequestView.Configuration
        ) {
            self.titleAndBodyView = titleAndBodyView
            self.profileUserPullRequestView = profileUserPullRequestView
        }
    }
    
    func configure(content: CardPullRequestViewContent) {
        titleAndBodyView.configure(content: content.titleAndBodyView)
        profileUserPullRequestView.configure(content: content.profileUserPullRequestView)
    }
}
