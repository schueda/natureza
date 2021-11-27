//
//  AddImageCollectionViewCell.swift
//  natureza
//
//  Created by André Schueda on 22/11/21.
//

import UIKit

class AddImageCollectionViewCell: UICollectionViewCell {
    var collection: PhotoCollection?
    var navigationController: UINavigationController?
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(clickedButton), for: .touchUpInside)
        
        let view = CreateButtonView(text: "Adicionar imagem", image: UIImage(systemName: "plus"))
        button.addSubview(view)
        view.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        return button
    }()
    
    @objc private func clickedButton() {
        let viewController = UINavigationController(rootViewController: CameraViewController(collection: collection))
        viewController.modalPresentationStyle = .fullScreen
        navigationController?.present(viewController, animated: true, completion: nil)
    }
    
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
