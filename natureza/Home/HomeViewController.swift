//
//  ViewController.swift
//  natureza
//
//  Created by André Schueda on 08/11/21.
//

import UIKit
import SnapKit
import AVFoundation

class HomeViewController: UIViewController {
    

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
    
    @objc func openCamera(sender: UIButton!) {
        print("Button tapped")
        let vc = CameraViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.present(vc, animated: true, completion: nil)
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
   
  }
    
 // Funções para setar as constraints da view
    
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
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(32)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16)
        }
        
        
    }


}

