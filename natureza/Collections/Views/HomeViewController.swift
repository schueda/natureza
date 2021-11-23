//
//  ViewController.swift
//  natureza
//
//  Created by André Schueda on 08/11/21.
//
import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    
//    let viewModel = CollectionViewModel()
    
    lazy var homeCollectionView: HomeCollectionView = {
        let collectionView = HomeCollectionView()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
       return collectionView
    }()
    
   override func viewDidLoad() {
        super.viewDidLoad()
       
       title = "Coleções"
       navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.tintColor]
        
        setupHomeCollectionView()
//        viewModel.retrieveImages()
   
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
