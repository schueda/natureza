//
//  CollectionViewController.swift
//  natureza
//
//  Created by André Schueda on 22/11/21.
//

import UIKit

class CollectionViewController: UIViewController {
    var collection: PhotoCollection?
    let viewModel = CollectionViewModel()
    
    lazy var titleTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .appBackground3
        textField.layer.cornerRadius = 3
        textField.textColor = .appLabelLight
        textField.attributedPlaceholder = NSAttributedString(string: "Nome da coleção", attributes: [NSAttributedString.Key.foregroundColor: UIColor.appGray3])
        
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: textField.frame.height))
        textField.rightViewMode = .always
        textField.text = collection?.name
        
        return textField
    }()
    
    lazy var photosCollection: PhotosCollectionView = {
        let collection = PhotosCollectionView(collection: collection, navigationController: navigationController)
        return collection
    }()
    
    lazy var videoButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .tintColor
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        button.setTitleColor(.appGray5, for: .normal)
        button.setTitle("Gerar vídeo", for: .normal)
        
        return button
    }()
    
    lazy var notificationView: NotificationView = {
        let view = NotificationView()
        view.backgroundColor = .appBackground3
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var noteTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .appBackground3
        textView.layer.cornerRadius = 3
        textView.isEditable = true
        textView.textContainerInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        textView.showsVerticalScrollIndicator = false
        textView.delegate = self
        textView.font = .systemFont(ofSize: 13, weight: .regular)
        
        textView.text = collection?.note ?? "Escreva uma nota sobre a coleção"
        
        if collection == nil {
            textView.textColor = .appGray3
        } else {
            textView.textColor = .appLabelLight
        }
        
        
        return textView
    }()

    init(collection: PhotoCollection? = nil) {
        self.collection = collection
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = collection?.name ?? "Nova coleção"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Salvar", style: .done, target: self, action: #selector(clickedSave))
        view.backgroundColor = .appBackground2
        
        if collection != nil {
            photosCollection.photos = viewModel.getPhotos(from: collection!)
        }
        
        setupTitleTextField()
        setupPhotosCollection()
        setupVideoButton()
        setupNotificationView()
        setupNoteTextView()
    }
    
    @objc private func clickedSave() {
        var note: String?
        if noteTextView.text == "Escreva uma nota sobre a coleção" {
            note = nil
        } else {
            note = noteTextView.text
        }
        if collection == nil {
            collection = PhotoCollection(name: titleTextField.text ?? "", photos: [], notification: Notification(), note: noteTextView.text)
        } else {
            collection?.name = titleTextField.text ?? ""
            collection?.note = note
        }
        
        viewModel.save(collection: collection!)
    }
    
    private func setupTitleTextField() {
        view.addSubview(titleTextField)
        titleTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
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
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
        }
    }
}

extension CollectionViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.appGray3 {
            textView.text = nil
            textView.textColor = UIColor.appLabelLight
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Escreva uma nota sobre a coleção"
            textView.textColor = UIColor.appGray3
        }
    }
    
}
