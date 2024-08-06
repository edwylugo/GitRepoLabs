//
//  ProfileUserPullRequestView.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 05/08/24.
//

import UIKit
import SDWebImage

class ProfileUserPullRequestView: UIView {
    
    // MARK: - Properties
    private let profileImageView = UIImageView(translateMask: false)
    private let stackUserView = UIStackView(translateMask: false).apply {
        $0.axis = .vertical
        $0.distribution = .fill
    }
    private let usernameLabel = UILabel(translateMask: false)
    private let nameLabel = UILabel(translateMask: false)
    
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
extension ProfileUserPullRequestView: CodeView {
    
    func buildViewHierarchy() {
        addSubview(profileImageView)
        addSubview(stackUserView)
        stackUserView.addArrangedSubviews([usernameLabel, nameLabel])
    }
    
    func setupConstraints() {
        profileImageView.anchor(top: topAnchor,
                                leading: leadingAnchor,
                                bottom: bottomAnchor)
        
        stackUserView.centerY(inView: profileImageView)
        stackUserView.anchor(leading: profileImageView.trailingAnchor,
                             paddingLeft: 8,
                             trailing: trailingAnchor)
    }
    
    func setupAdditionalConfiguration() {
        profileImageView.setDimensions(width: 36, height: 36)
        profileImageView.contentMode = .scaleAspectFit
        usernameLabel.font = UIFont.boldSystemFont(ofSize: 14)
        usernameLabel.textColor = .systemBlue
        usernameLabel.numberOfLines = 1
        usernameLabel.textAlignment = .left
        nameLabel.font = UIFont.systemFont(ofSize: 10)
        nameLabel.textColor = .systemGray
        nameLabel.numberOfLines = 1
        nameLabel.textAlignment = .left
    }
}

// MARK: - Configurable -> Populate Data ViewModel
extension ProfileUserPullRequestView: Configurable {
    typealias Configuration = ProfileUserPullRequestViewContent
    
    struct ProfileUserPullRequestViewContent {
        let userNameText: String
        let nameText: String
        let avatarURL: URL?
        
        init(userNameText: String, nameText: String, avatarURL: URL?) {
            self.userNameText = userNameText
            self.nameText = nameText
            self.avatarURL = avatarURL
        }
    }
    
    func configure(content: ProfileUserPullRequestViewContent) {
        if content.avatarURL != nil {
            profileImageView.sd_setImage(with: content.avatarURL)
        } else {
            profileImageView.image = Images.Icons.ic_profile
        }
        usernameLabel.text = content.userNameText
        nameLabel.text = content.nameText
        setupAdditionalConfiguration()
    }
}
