//
//  AddImageCollectionViewCell.swift
//  natureza
//
//  Created by André Schueda on 22/11/21.
//

import UIKit

class AddImageCollectionViewCell: UICollectionViewCell {
    lazy var button: UIButton = {
        let button = UIButton()
        
        let view = CreateButtonView(text: "Adicionar imagem")
        button.addSubview(view)
        view.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupButton()
    }
    
    private func setupButton() {
        addSubview(button)
        button.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
