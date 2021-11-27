//
//  NotesViewController.swift
//  natureza
//
//  Created by Gabriel Puppi on 24/11/21.
//

import UIKit
import SnapKit

class NotesViewController: UIViewController {
    
    lazy var notesSheet: UIView = {
        let view = UIView()
        view.backgroundColor = .appBackground1
        view.translatesAutoresizingMaskIntoConstraints = false
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
        textView.text = "Escreva uma nota sobre a imagem"
        textView.textColor = .secondaryLabel
        
        return textView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Anotações"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Concluir", style: .done, target: self, action: #selector(rightBarButtonClicked))

        
        setupNotesView()
        setupNotesTextView()
        
    }
    
    @objc func rightBarButtonClicked() {
        
        self.navigationController?.dismiss(animated: true, completion: nil)
        
    }

    func setupNotesView(){
        view.addSubview(notesSheet)
        notesSheet.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    
    func setupNotesTextView() {
        notesSheet.addSubview(noteTextView)
        noteTextView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(72)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-32)
        }
    }
    
}

extension NotesViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .secondaryLabel  {
            textView.text = nil
            textView.textColor = .appLabelLight
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Escreva uma nota sobre a imagem"
            textView.textColor = .secondaryLabel
        }
    }
}
