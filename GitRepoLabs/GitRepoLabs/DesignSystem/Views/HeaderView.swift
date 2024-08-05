//
//  HeaderView.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 05/08/24.
//

import UIKit

protocol HeaderViewDelegate: AnyObject {
    func leftButtonAction()
}

class HeaderView: UIView {

    // MARK: - Properties
    weak var delegate: HeaderViewDelegate?

    private let stackView = UIStackView(translateMask: false).apply {
        $0.distribution = .fill
        $0.axis = .horizontal
        $0.spacing = .zero
        $0.isUserInteractionEnabled = true
    }
    
    private let containerView = UIView(translateMask: false)
    private let backButton = UIButton(translateMask: false).apply {
        $0.backgroundColor = .clear
        $0.isEnabled = true
        $0.isUserInteractionEnabled = true
        $0.setDimensions(width: 28, height: 28)
        $0.setImage(Images.Icons.ic_voltar, for: .normal)
        $0.tintColor = .white
    }
    private let titleLabel = UILabel(translateMask: false).apply {
        $0.numberOfLines = 1
        $0.font = UIFont.systemFont(ofSize: 24)
        $0.textColor = .white
        $0.text = "Nome Repositório"
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
    
    @objc func leftButton() {
        delegate?.leftButtonAction()
    }
}

extension HeaderView: CodeView {
    func buildViewHierarchy() {
        addSubview(stackView)
        stackView.addArrangedSubviews([containerView])
        containerView.addSubview(backButton)
        containerView.addSubview(titleLabel)
    }

    func setupConstraints() {
        stackView.anchor(
            top: topAnchor, paddingTop: 28,
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor, paddingRight: 8
        )
        
        containerView.anchor(
            top: stackView.topAnchor,
            leading: stackView.leadingAnchor,
            bottom: stackView.bottomAnchor,
            trailing: stackView.trailingAnchor
        )
        
        backButton.anchor(
            leading: containerView.leadingAnchor
        )
        
        titleLabel.anchor(
            top: containerView.topAnchor,
            leading: backButton.trailingAnchor, paddingLeft: 16,
            bottom: containerView.bottomAnchor,
            trailing: containerView.trailingAnchor
        )
    }

    func setupAdditionalConfiguration() {
        backgroundColor = .darkGray
        backButton.addTarget(self, action: #selector(leftButton), for: .touchUpInside)
    }
}
