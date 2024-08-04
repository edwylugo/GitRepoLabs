//
//  TitleAndBodyView.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 03/08/24.
//

import UIKit

class TitleAndBodyView: UIView {
    
    // MARK: - Properties
    
    private let stackView = UIStackView(translateMask: false).apply {
        $0.axis = .vertical
        $0.spacing = 4
        $0.distribution = .fill
    }
    
    private let titleLabel = UILabel(translateMask: false).apply {
        $0.font = UIFont.boldSystemFont(ofSize: 16)
        $0.textColor = .systemBlue
        $0.numberOfLines = .zero
    }
    
    private let bodyLabel = UILabel(translateMask: false).apply {
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = .black
        $0.numberOfLines = .zero
    }
    
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
extension TitleAndBodyView: CodeView {
    
    func buildViewHierarchy() {
        addSubview(stackView)
        stackView.addArrangedSubviews([titleLabel, bodyLabel])
    }
    
    func setupConstraints() {
        stackView.anchor(top: topAnchor,
                         leading: leadingAnchor,
                         bottom: bottomAnchor,
                         trailing: trailingAnchor)
    }
}

// MARK: - Configurable -> Populate Data ViewModel
extension TitleAndBodyView: Configurable {
    typealias Configuration = TitleAndBodyViewContent
    
    struct TitleAndBodyViewContent {
        let textTitle: String
        let textBody: String
        
        init(textTitle: String, textBody: String) {
            self.textTitle = textTitle
            self.textBody = textBody
        }
    }
    
    func configure(content: TitleAndBodyViewContent) {
        titleLabel.text = content.textTitle
        bodyLabel.text = content.textBody
     }
}
