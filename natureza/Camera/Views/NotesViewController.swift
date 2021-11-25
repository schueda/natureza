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
        let textFieldView = UIView()
        textFieldView.backgroundColor = .appBackground3
        textFieldView.layer.cornerRadius = 20
        textFieldView.translatesAutoresizingMaskIntoConstraints = false
        return textFieldView
    }()
    
    lazy var noteTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .appBackground2
        textView.layer.cornerRadius = 18
        textView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        textView.text = "Adicione notas a suas imagens"
        textView.textColor = .secondaryLabel
        textView.textAlignment = .left
        return textView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNotesView()
        setupNotesTextView()
        
    }

    func setupNotesView(){
        view.addSubview(notesSheet)
        notesSheet.snp.makeConstraints { make in
            make.height.equalTo(300)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    
    func setupNotesTextView() {
        notesSheet.addSubview(noteTextView)
        noteTextView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-32)
        }
    }
    
}
