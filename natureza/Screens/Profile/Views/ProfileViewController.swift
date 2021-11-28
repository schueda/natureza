//
//  ProfileViewController.swift
//  natureza
//
//  Created by André Schueda on 27/11/21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    lazy var placeHolderView: PlaceHolderView = {
        let view = PlaceHolderView(title: "Essa não!\nParece que ainda não tem nada aqui...", text: "Essa função ainda não está disponível no app. Tente as outras funções que estão liberadas.")
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Perfil"
        
        setupPlaceHolderView()
    }
    
    func setupPlaceHolderView() {
        view.addSubview(placeHolderView)
        placeHolderView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(32)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(32)
        }
    }
}
