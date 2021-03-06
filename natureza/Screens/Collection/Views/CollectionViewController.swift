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
    var savedPhotos: [Photo] = []
    var photos: [Photo] = []
    
    lazy var titleTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemBackground
        textField.layer.cornerRadius = 3
        textField.textColor = .label
        textField.attributedPlaceholder = NSAttributedString(string: "Nome da coleção", attributes: [NSAttributedString.Key.foregroundColor: UIColor.secondaryLabel])
        
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: textField.frame.height))
        textField.rightViewMode = .always
        textField.text = collection?.name
        textField.addTarget(self, action: #selector(changedTextField), for: .editingChanged)
        
        return textField
    }()
    
    @objc func changedTextField() {
       enableOrDisableSaveButton()
    }
    
    private func enableOrDisableSaveButton() {
        guard let text = titleTextField.text else { return }
        if text != "" {
            navigationItem.rightBarButtonItem?.isEnabled = true
            navigationItem.title = text
            
        } else {
            navigationItem.rightBarButtonItem?.isEnabled = false
            navigationItem.title = "Coleção"
        }
    }
    
    lazy var photosCollection: PhotosCollectionView = {
        let collection = PhotosCollectionView(collection: collection, navigationController: navigationController, viewModel: viewModel, photos: photos)
        return collection
    }()
    
    lazy var videoButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .tintColor
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        button.setTitleColor(.systemBackground, for: .normal)
        button.setTitle("Gerar vídeo", for: .normal)
        button.addTarget(self, action: #selector(generateVideoClicked), for: .touchUpInside)
        
        return button
    }()
    
    lazy var notificationView: NotificationView = {
        let view = NotificationView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var noteTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .systemBackground
        textView.layer.cornerRadius = 3
        textView.isEditable = true
        textView.textContainerInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        textView.showsVerticalScrollIndicator = false
        textView.delegate = self
        textView.font = .systemFont(ofSize: 13, weight: .regular)
        
        if let collection = collection {
            if collection.note.isEmpty {
                textView.textColor = .secondaryLabel
                textView.text = "Escreva uma nota sobre a coleção"
            } else {
                textView.textColor = .label
                textView.text = collection.note
            }
        } else {
            textView.textColor = .secondaryLabel
            textView.text = "Escreva uma nota sobre a coleção"
        }
        
        return textView
    }()

    init(collection: PhotoCollection? = PhotoCollection(name: "", photos: [], notification: Notification(), note: "")) {
        self.collection = collection
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        if let collection = collection {
            guard let photosBuffer = collection.photosBuffer else { return }
            savedPhotos = viewModel.getPhotos(from: collection)
            photos = savedPhotos + photosBuffer
        }
        
        setupTitleTextField()
        setupPhotosCollection()
        setupVideoButton()
        setupNotificationView()
        setupNoteTextView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let photoBuffer = collection?.photosBuffer {
            photos = savedPhotos + photoBuffer
        }
        photosCollection.photos = photos
        photosCollection.reloadCollection()
    }
    
    private func setupView() {
        if let collection = collection {
            title = collection.name.isEmpty ? "Coleção" : collection.name
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Salvar", style: .done, target: self, action: #selector(clickedSave))
        enableOrDisableSaveButton()
        view.backgroundColor = .secondarySystemBackground
    }
    
    @objc private func clickedSave() {
        
        collection?.name = titleTextField.text ?? ""
        collection?.note = noteTextView.text ?? ""
        
        guard let collection = collection else { return }

        viewModel.save(collection: collection)
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func generateVideoClicked() {
    
        let settings = RenderSettings()
        guard let collection = collection else { return }
        let imageAnimator = ImageAnimator(renderSettings: settings, collection: collection)
        imageAnimator.render() {
            
            let alert = UIAlertController(title: "Vídeo salvo na galeria.", message: "O vídeo gerado a partir da sua coleção foi salvo galeria do Iphone", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)

            
        }
    
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
        if textView.textColor == .secondaryLabel  {
            textView.text = nil
            textView.textColor = .label
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Escreva uma nota sobre a coleção"
            textView.textColor = .secondaryLabel
        }
    }
}
