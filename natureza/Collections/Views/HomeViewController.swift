//
//  ViewController.swift
//  natureza
//
//  Created by André Schueda on 08/11/21.
//
import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    
    let viewModel = CollectionViewModel()
    
    lazy var openCameraButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Open Camera", for: .normal)
        button.setTitleColor(.purple, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 30
        button.titleLabel?.font = .systemFont(ofSize: 18)
        button.addTarget(self, action: #selector(openCamera), for: .touchUpInside)
        return button
    }()
    
    
    @objc func openCamera() {
        
        navigationController?.pushViewController(CameraViewController(), animated: false)
        
    }
    
    lazy var homeCollectionView: HomeCollectionView = {
        let collectionView = HomeCollectionView()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
       return collectionView
    }()
    
   override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHomeCollectionView()
        setupOpenCameraButton()
        viewModel.retrieveImages()
   
  }
    
 // Funções para setar a tela
    
    private func setupOpenCameraButton() {
        view.addSubview(openCameraButton)
        openCameraButton.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-32)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(32)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-32)
        }
   }
    
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
