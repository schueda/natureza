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
        button.addTarget(self, action: #selector(addImageTapped), for: .touchUpInside)
        
        let view = CreateButtonView(text: "Adicionar imagem", image: UIImage(systemName: "camera"))
        button.addSubview(view)
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        return button
    }()
    
    @objc private func addImageTapped() {
        let viewController = UINavigationController(rootViewController: CameraViewController())
        viewController.modalPresentationStyle = .fullScreen
        navigationController?.present(viewController, animated: true, completion: nil)
    }

    lazy var addCollectionButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(addCollectionTapped), for: .touchUpInside)
        
        let view = CreateButtonView(text: "Adicionar coleção", image: UIImage(systemName: "plus.rectangle.on.rectangle"))
        button.addSubview(view)
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        return button
    }()
    
    @objc private func addCollectionTapped() {
        navigationController?.pushViewController(CollectionViewController(), animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Criar"
        view.backgroundColor = .appBackground2

        
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
