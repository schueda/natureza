//
//  PhotoViewController.swift
//  natureza
//
//  Created by André Schueda on 27/11/21.
//

import UIKit

class PhotoViewController: UIViewController {

    lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var notesTextView: UITextView = {
        let textView = UITextView()
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupPhotoImageView()
        setupNotesTextView()
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
