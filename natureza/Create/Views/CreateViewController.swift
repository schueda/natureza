//
//  CreateViewController.swift
//  natureza
//
//  Created by André Schueda on 19/11/21.
//

import UIKit

class CreateViewController: UIViewController {
    
    lazy var buttonsStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 40
        stack.backgroundColor = .clear
        stack.distribution = .fillEqually
        return stack
    }()
    
    lazy var addImageButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .yellow.withAlphaComponent(0.6)
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.yellow.cgColor
        button.layer.borderWidth = 2
        
        let view = ButtonView(text: "Adicionar imagem")
        button.addSubview(view)
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        return button
    }()

    lazy var addCollectionButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .yellow.withAlphaComponent(0.6)
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.yellow.cgColor
        button.layer.borderWidth = 2
        
        let view = ButtonView(text: "Adicionar coleção")
        button.addSubview(view)
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtonsStack()
        
        [
            addImageButton,
            addCollectionButton
        ].forEach({ buttonsStack.addArrangedSubview($0) })
        
    }
    
    private func setupButtonsStack() {
        view.addSubview(buttonsStack)
        buttonsStack.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(32)
            make.leading.equalTo(40)
            make.trailing.equalTo(-40)
            make.height.equalTo(UIScreen.main.bounds.height * 0.25)
        }
    }
}
