//
//  PhotoViewController.swift
//  natureza
//
//  Created by André Schueda on 27/11/21.
//

import UIKit

class PhotoViewController: UIViewController {
    let photo: Photo
    let viewModel: PhotoViewModel

    lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = photo.image
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var notesTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .systemBackground
        textView.layer.cornerRadius = 3
        textView.isEditable = true
        textView.textContainerInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        textView.showsVerticalScrollIndicator = false
        textView.delegate = self
        textView.font = .systemFont(ofSize: 13, weight: .regular)
        
        if photo.note.isEmpty {
            textView.textColor = .secondaryLabel
            textView.text = "Escreva uma nota sobre a imagem"
        } else {
            textView.textColor = .label
            textView.text = photo.note
        }
        
        return textView
    }()
    
    init(photo: Photo, viewModel: PhotoViewModel) {
        self.photo = photo
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()

        setupPhotoImageView()
        setupNotesTextView()
    }
    
    private func setupView() {
        view.backgroundColor = .secondarySystemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Salvar", style: .done, target: self, action: #selector(clickedSave))
    }
    
    @objc private func clickedSave() {
        photo.note = notesTextView.text
        viewModel.save(photo: photo)
        navigationController?.popViewController(animated: true)
    }
    
    private func setupPhotoImageView() {
        view.addSubview(photoImageView)
        photoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-16)
            make.height.equalTo(UIScreen.main.bounds.height * 0.45)
        }
    }
    
    private func setupNotesTextView() {
        view.addSubview(notesTextView)
        notesTextView.snp.makeConstraints { make in
            make.top.equalTo(photoImageView.snp.bottom).offset(16)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-16)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-16)
        }
    }
}

extension PhotoViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .secondaryLabel {
            textView.text = nil
            textView.textColor = .label
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Escreva uma nota sobre a imagem"
            textView.textColor = .secondaryLabel
        }
    }
}
