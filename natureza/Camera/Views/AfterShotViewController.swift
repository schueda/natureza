//
//  AfterShotViewController.swift
//  natureza
//
//  Created by Gabriel Puppi on 16/11/21.
//

import UIKit
import SnapKit

class AfterShotViewController: UIViewController {
    
    var image: UIImage
    let viewModel = AfterShotViewModel()
    
    let dismissImageButton: UIButton = {
        let button = UIButton()
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "arrow.uturn.backward")
        button.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(dismissPhoto), for: .touchUpInside)
        return button
    
    }()
    
    let confirmPhotoButton: UIButton = {
        let button = UIButton()
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "arrow.down.circle")
        button.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(confirmPhoto), for: .touchUpInside)
        return button
    }()
    
    @objc func dismissPhoto(){
        self.navigationController?.popViewController(animated: false)
    }
    
    
    @objc func confirmPhoto(){
        
        viewModel.savePhoto(image: image)
        
    }
    
  override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        setupAfterShot()
        setupDismissButton()
        

        // Do any additional setup after loading the view.
    }
    
    init(image: UIImage) {
        self.image = image
        super.init(nibName: nil, bundle: nil)
    } 
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupDismissButton(){
        view.addSubview(dismissImageButton)
        dismissImageButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(32)
        
        }
       
    }
   func setupConfirmButton() {
        view.addSubview(confirmPhotoButton)
        confirmPhotoButton.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-36)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(32)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-32)
        }
   }
    
   func setupAfterShot() {
        
        let image = image
        let afterShotView = UIImageView()
        afterShotView.image = image
        afterShotView.contentMode = .scaleAspectFill
        
        view.addSubview(afterShotView)
        afterShotView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    
    }
    
    
}
