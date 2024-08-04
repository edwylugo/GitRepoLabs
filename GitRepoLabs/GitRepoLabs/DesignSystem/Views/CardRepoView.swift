//
//  CardRepoView.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 03/08/24.
//

import UIKit

class CardRepoView: UIView {
    
    // MARK: - Properties
    
    private let stackView = UIStackView(translateMask: false).apply {
        $0.axis = .vertical
        $0.spacing = 8
        $0.distribution = .fill
    }
    
    private let titleAndBodyView = TitleAndBodyView(translateMask: false)
    
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
        addSubview(stackView)
        stackView.addArrangedSubviews([titleAndBodyView])
    }
    
    func setupConstraints() {
        stackView.anchor(top: topAnchor,
                         leading: leadingAnchor,
                         bottom: bottomAnchor,
                         trailing: trailingAnchor)
    }
}

// MARK: - Configurable -> Populate Data ViewModel
extension CardRepoView: Configurable {
    typealias Configuration = CardRepoViewContent
    
    struct CardRepoViewContent {
        let titleAndBodyView: TitleAndBodyView.Configuration
        
        init(titleAndBodyView: TitleAndBodyView.Configuration) {
            self.titleAndBodyView = titleAndBodyView
        }
    }
    
    func configure(content: CardRepoViewContent) {
        titleAndBodyView.configure(content: content.titleAndBodyView)
    }
}
