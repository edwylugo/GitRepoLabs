//
//  NumbersView.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 04/08/24.
//

import UIKit

class NumbersView: UIView {
    
    // MARK: - Properties
    
    private let iconImageView = UIImageView(translateMask: false)
    private let numberLabel = UILabel(translateMask: false)
    
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
extension NumbersView: CodeView {
    
    func buildViewHierarchy() {
        addSubview(iconImageView)
        addSubview(numberLabel)
    }
    
    func setupConstraints() {
        iconImageView.centerY(inView: self)
        iconImageView.anchor(leading: leadingAnchor)
        numberLabel.anchor(top: topAnchor,
                           leading: iconImageView.trailingAnchor, paddingLeft: 4,
                           bottom: bottomAnchor,
                           trailing: trailingAnchor)
    }
    
    func setupAdditionalConfiguration() {
        iconImageView.setDimensions(width: 16, height: 16)
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.tintColor = .colorGold()
        numberLabel.font = UIFont.boldSystemFont(ofSize: 14)
        numberLabel.textColor = .colorGold()
        numberLabel.numberOfLines = .zero
    }
}

// MARK: - Configurable -> Populate Data ViewModel
extension NumbersView: Configurable {
    typealias Configuration = NumbersViewContent
    
    struct NumbersViewContent {
        let icon: UIImage
        let textNumber: String
        
        init(icon: UIImage, textNumber: String) {
            self.icon = icon
            self.textNumber = textNumber
        }
    }
    
    func configure(content: NumbersViewContent) {
        iconImageView.image = content.icon
        numberLabel.text = content.textNumber
        setupAdditionalConfiguration()
    }
}
