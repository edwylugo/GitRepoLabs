//
//  CardRepoView.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 03/08/24.
//

import UIKit

class CardRepoView: UIView {
    
    // MARK: - Properties
    
    private let stackMainView = UIStackView(translateMask: false).apply {
        $0.axis = .horizontal
        $0.spacing = 24
        $0.distribution = .fillProportionally
    }
    
    private let stackView = UIStackView(translateMask: false).apply {
        $0.axis = .vertical
        $0.spacing = 16
        $0.distribution = .fill
    }
    
    private let titleAndBodyView = TitleAndBodyView(translateMask: false)
    
    private let containerNumbers = UIView(translateMask: false)
    private let stackNumbers = UIStackView(translateMask: false).apply {
        $0.axis = .horizontal
        $0.spacing = 16
        $0.distribution = .fill
    }
    private let numberForksView = NumbersView(translateMask: false)
    private let numberStarsView = NumbersView(translateMask: false)
    
    private let containerProfile = UIView(translateMask: false)
    private let profileUserRepoView = ProfileUserRepoView(translateMask: false)
    
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
extension CardRepoView: CodeView {
    
    func buildViewHierarchy() {
        addSubview(stackMainView)
        stackMainView.addArrangedSubviews([stackView, containerProfile])
        containerNumbers.addSubview(profileUserRepoView)
        stackView.addArrangedSubviews([titleAndBodyView, containerNumbers])
        containerNumbers.addSubview(stackNumbers)
        stackNumbers.addArrangedSubviews([numberForksView, numberStarsView])
    }
    
    func setupConstraints() {
        stackMainView.anchor(top: topAnchor,
                             leading: leadingAnchor,
                             bottom: bottomAnchor,
                             trailing: trailingAnchor)
        
        stackNumbers.anchor(top: containerNumbers.topAnchor,
                            leading: containerNumbers.leadingAnchor,
                            bottom: containerNumbers.bottomAnchor)
        
        containerProfile.setWidth(width: 100)
        profileUserRepoView.centerX(inView: containerProfile)
        profileUserRepoView.centerY(inView: containerProfile)
    }
}

// MARK: - Configurable -> Populate Data ViewModel
extension CardRepoView: Configurable {
    typealias Configuration = CardRepoViewContent
    
    struct CardRepoViewContent {
        let titleAndBodyView: TitleAndBodyView.Configuration
        let numberForksView: NumbersView.Configuration
        let numberStarsView: NumbersView.Configuration
        let profileUserRepoView: ProfileUserRepoView.Configuration
        
        init(titleAndBodyView: TitleAndBodyView.Configuration,
             numberForksView: NumbersView.Configuration,
             numberStarsView: NumbersView.Configuration,
             profileUserRepoView: ProfileUserRepoView.Configuration
        ) {
            self.titleAndBodyView = titleAndBodyView
            self.numberForksView = numberForksView
            self.numberStarsView = numberStarsView
            self.profileUserRepoView = profileUserRepoView
        }
    }
    
    func configure(content: CardRepoViewContent) {
        titleAndBodyView.configure(content: content.titleAndBodyView)
        numberForksView.configure(content: content.numberForksView)
        numberStarsView.configure(content: content.numberStarsView)
        profileUserRepoView.configure(content: content.profileUserRepoView)
    }
}
