//
//  ProfileUserRepoView.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 04/08/24.
//

import UIKit
import SDWebImage

class ProfileUserRepoView: UIView {
    
    // MARK: - Properties
    private let containerImage = UIView(translateMask: false)
    private let profileImageView = UIImageView(translateMask: false).apply {
        $0.contentMode = .scaleAspectFill
        $0.setDimensions(width: 48, height: 48)
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
extension ProfileUserRepoView: CodeView {
    
    func buildViewHierarchy() {
        addSubview(containerImage)
        containerImage.addSubview(profileImageView)
        addSubview(usernameLabel)
        addSubview(nameLabel)
    }
    
    func setupConstraints() {
        containerImage.anchor(top: topAnchor,
                                leading: leadingAnchor,
                                trailing: trailingAnchor, height: 48)
        
        profileImageView.centerX(inView: containerImage)
        profileImageView.centerY(inView: containerImage)
        
        usernameLabel.anchor(top: containerImage.bottomAnchor, paddingTop: 4,
                             leading: leadingAnchor,
                             trailing: trailingAnchor)
        
        nameLabel.anchor(top: usernameLabel.bottomAnchor, paddingTop: 4,
                         leading: leadingAnchor,
                         bottom: bottomAnchor,
                         trailing: trailingAnchor)
        
    }
    
    func setupAdditionalConfiguration() {
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
        let userNameText: String
        let nameText: String
        let avatarURL: URL?
        
        init(userNameText: String, nameText: String, avatarURL: URL?) {
            self.userNameText = userNameText
            self.nameText = nameText
            self.avatarURL = avatarURL
        }
    }
    
    func configure(content: ProfileUserRepoViewContent) {
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
