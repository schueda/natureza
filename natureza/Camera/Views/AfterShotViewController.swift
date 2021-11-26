//
//  AfterShotViewController.swift
//  natureza
//
//  Created by Gabriel Puppi on 16/11/21.
//

import UIKit
import SnapKit

class AfterShotViewController: UIViewController {
    let collection: PhotoCollection?
    let viewModel = AfterShotViewModel()
    let notesVC = NotesViewController()
    
    var image: UIImage
    
    let dismissImageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.uturn.backward"), for: .normal)
        button.setTitle("Descartar", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12)
        button.alignTextBelow()
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
    
    let notesButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "note.text.badge.plus"), for: .normal)
        button.setTitle("Anotar", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12)
        button.alignTextBelow()
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(addNoteToPhoto), for: .touchUpInside)
        return button
    }()
    
    @objc func dismissPhoto(){
        self.navigationController?.popViewController(animated: false)
    }
    
    @objc func confirmPhoto(){
        
        let photo = Photo(note: notesVC.noteTextView.text ?? "", image: image)
        if let collection = collection {
            viewModel.savePhoto(photo)
            viewModel.savePhotoToCollection(photo: photo, collection: collection)
            navigationController?.popViewController(animated: true)
            navigationController?.popViewController(animated: true)
        } else {
            let nav = UINavigationController(rootViewController: CollectionsModalViewController(viewModel: CollectionsModalViewModel(), photo: photo))
            nav.modalPresentationStyle = .pageSheet
            if let sheet = nav.sheetPresentationController {
                sheet.detents = [.medium()]
            }
            present(nav, animated: true, completion: nil)
        }
    }
    
    @objc func addNoteToPhoto(){
        let nav = UINavigationController(rootViewController: notesVC)
        nav.modalPresentationStyle = .pageSheet
        if let sheet = nav.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        present(nav, animated: true, completion: nil)
        
 }
        
    
    
  override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        setupAfterShot()
        setupDismissButton()
        setupConfirmButton()
        setupNotesButton()
        

        // Do any additional setup after loading the view.
    }
    
    init(image: UIImage, collection: PhotoCollection?) {
        self.collection = collection
        self.image = image
        super.init(nibName: nil, bundle: nil)
    } 
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupDismissButton(){
        view.addSubview(dismissImageButton)
        dismissImageButton.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-32)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(96)
        
        }
       
    }

    
   func setupConfirmButton() {
        view.addSubview(confirmPhotoButton)
        confirmPhotoButton.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-32)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(72)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-72)
        }
   }
    
    
    func setupNotesButton(){
        view.addSubview(notesButton)
       notesButton.snp.makeConstraints { make in
           make.height.equalTo(80)
           make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-32)
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
