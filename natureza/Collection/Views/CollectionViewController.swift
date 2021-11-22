//
//  CollectionViewController.swift
//  natureza
//
//  Created by André Schueda on 22/11/21.
//

import UIKit

class CollectionViewController: UIViewController {
    
    lazy var titleTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .appGray1
        textField.layer.cornerRadius = 10
        textField.placeholder = "Nome da coleção"
        
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: textField.frame.height))
        textField.rightViewMode = .always
        
        return textField
    }()
    
    lazy var photosCollection: PhotosCollectionView = {
        let collection = PhotosCollectionView()
        collection.backgroundColor = .red
        return collection
    }()
    
    lazy var videoButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .tintColor
        button.layer.cornerRadius = 10
        button.setTitle("Gerar vídeo", for: .normal)
        
        return button
    }()
    
    lazy var notificationView: NotificationView = {
        let view = NotificationView()
        view.backgroundColor = .appGray3
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var noteTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .appGray1
        textView.layer.cornerRadius = 10
        textView.isEditable = true
        
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Nova coleção"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.tintColor]
        
        setupTitleTextField()
        setupPhotosCollection()
        setupVideoButton()
        setupNotificationView()
        setupNoteTextView()
    }
    
    private func setupTitleTextField() {
        view.addSubview(titleTextField)
        titleTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(32)
            make.height.equalTo(50)
        }
    }
    
    private func setupPhotosCollection() {
        view.addSubview(photosCollection)
        photosCollection.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(titleTextField.snp.bottom).offset(16)
            make.height.equalTo(210)
        }
    }
    
    private func setupVideoButton() {
        view.addSubview(videoButton)
        videoButton.snp.makeConstraints { make in
            make.top.equalTo(photosCollection.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(50)
        }
    }
    
    private func setupNotificationView() {
        view.addSubview(notificationView)
        notificationView.snp.makeConstraints { make in
            make.top.equalTo(videoButton.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(50)
        }
    }
    
    private func setupNoteTextView() {
        view.addSubview(noteTextView)
        noteTextView.snp.makeConstraints { make in
            make.top.equalTo(notificationView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-32)
        }
    }
}
