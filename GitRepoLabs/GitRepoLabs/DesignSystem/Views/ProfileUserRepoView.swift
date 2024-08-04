//
//  ProfileUserRepoView.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 04/08/24.
//

import UIKit

class ProfileUserRepoView: UIView {
    
    // MARK: - Properties
    
    private let profileImageView = UIImageView(translateMask: false)
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
extension ProfileUserRepoView: CodeView {
    
    func buildViewHierarchy() {
        addSubview(profileImageView)
        addSubview(usernameLabel)
        addSubview(nameLabel)
    }
    
    func setupConstraints() {
        profileImageView.anchor(top: topAnchor,
                                leading: leadingAnchor,
                                trailing: trailingAnchor)
        
        usernameLabel.anchor(top: profileImageView.bottomAnchor, paddingTop: 4,
                             leading: leadingAnchor,
                             trailing: trailingAnchor)
        
        nameLabel.anchor(top: usernameLabel.bottomAnchor, paddingTop: 4,
                         leading: leadingAnchor,
                         bottom: bottomAnchor,
                         trailing: trailingAnchor)
        
    }
    
    func setupAdditionalConfiguration() {
        profileImageView.setHeight(height: 48)
        profileImageView.contentMode = .scaleAspectFit
        usernameLabel.font = UIFont.boldSystemFont(ofSize: 14)
        usernameLabel.textColor = .systemBlue
        usernameLabel.numberOfLines = 1
        usernameLabel.textAlignment = .center
        nameLabel.font = UIFont.systemFont(ofSize: 10)
        nameLabel.textColor = .systemGray
        nameLabel.numberOfLines = 1
        nameLabel.textAlignment = .center
    }
}

// MARK: - Configurable -> Populate Data ViewModel
extension ProfileUserRepoView: Configurable {
    typealias Configuration = ProfileUserRepoViewContent
    
    struct ProfileUserRepoViewContent {
        let profileIcon: UIImage
        let userNameText: String
        let nameText: String
        
        init(profileIcon: UIImage, userNameText: String, nameText: String) {
            self.profileIcon = profileIcon
            self.userNameText = userNameText
            self.nameText = nameText
        }
    }
    
    func configure(content: ProfileUserRepoViewContent) {
        profileImageView.image = content.profileIcon
        usernameLabel.text = content.userNameText
        nameLabel.text = content.nameText
        setupAdditionalConfiguration()
    }
}
