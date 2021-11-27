//
//  ViewController.swift
//  natureza
//
//  Created by André Schueda on 08/11/21.
//
import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    lazy var homeCollectionView: HomeCollectionView = {
        let collectionView = HomeCollectionView(navigationController: navigationController)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Coleções"
        view.backgroundColor = .appBackground2
        
        setupHomeCollectionView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        homeCollectionView.reloadCollection()
    }
    
    // Funções para setar a tela
    private func setupHomeCollectionView() {
        view.addSubview(homeCollectionView)
        homeCollectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
    }
    
    
}
