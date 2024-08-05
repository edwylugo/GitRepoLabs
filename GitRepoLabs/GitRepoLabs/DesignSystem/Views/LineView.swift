//
//  LineView.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 05/08/24.
//

import UIKit

class LineView: UIView {

    // MARK: - Properties
    
    private let lineView = UIView(translateMask: false).apply {
        $0.backgroundColor = .systemGray5
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

extension LineView: CodeView {
    func buildViewHierarchy() {
        addSubview(lineView)
    }
    
    func setupConstraints() {
        lineView.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor
        )
    }
    
    func setupAdditionalConfiguration() {
        setHeight(height: 1)
    }
}
