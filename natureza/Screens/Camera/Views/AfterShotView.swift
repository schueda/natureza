//
//  AfterShotView.swift
//  natureza
//
//  Created by Gabriel Puppi on 16/11/21.
//

import UIKit
import SnapKit

class AfterShotView: UIView {
    let viewModel: CameraViewModel
    
    let collection: PhotoCollection?
    var navigationController: UINavigationController?
    let notesVC = NotesViewController()
    
    var image: UIImage? {
        didSet {
            afterShotImageView.image = image
        }
    }
    
    lazy var afterShotImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var dismissImageButton: UIButton = {
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
    
    lazy var confirmPhotoButton: UIButton = {
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
    
    lazy var notesButton: UIButton = {
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
        viewModel.startCamera()
        alpha = 0
    }
    
    @objc func confirmPhoto(){
        let photo = Photo(note: notesVC.noteTextView.text ?? "", image: image)
        if let collection = collection {
            viewModel.savePhotoToCollectionBuffer(photo: photo, collection: collection)
            navigationController?.dismiss(animated: true, completion: nil)
        } else {
            let nav = UINavigationController(rootViewController: CollectionsModalViewController(viewModel: CollectionsModalViewModel(), photo: photo))
            nav.modalPresentationStyle = .pageSheet
            if let sheet = nav.sheetPresentationController {
                sheet.detents = [.medium()]
            }
            navigationController?.present(nav, animated: true, completion: nil)
        }
    }
    
    @objc func addNoteToPhoto(){
        let nav = UINavigationController(rootViewController: notesVC)
        nav.modalPresentationStyle = .pageSheet
        if let sheet = nav.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        navigationController?.present(nav, animated: true, completion: nil)
    }
    
    init(frame: CGRect = .zero, collection: PhotoCollection?, navigationController: UINavigationController?, viewModel: CameraViewModel) {
        self.collection = collection
        self.navigationController = navigationController
        self.viewModel = viewModel
        super.init(frame: frame)
        
        setupAfterShot()
        setupDismissButton()
        setupConfirmButton()
        setupNotesButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupDismissButton(){
        addSubview(dismissImageButton)
        dismissImageButton.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-32)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.leading).offset(96)
        }
    }
    
    func setupConfirmButton() {
        addSubview(confirmPhotoButton)
        confirmPhotoButton.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-32)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(72)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-72)
        }
    }
    
    func setupNotesButton(){
        addSubview(notesButton)
        notesButton.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-32)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-32)
        }
    }
    
    func setupAfterShot() {
        addSubview(afterShotImageView)
        afterShotImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
