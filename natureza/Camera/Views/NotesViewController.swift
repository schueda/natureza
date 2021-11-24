//
//  NotesViewController.swift
//  natureza
//
//  Created by Gabriel Puppi on 24/11/21.
//

import UIKit
import SnapKit

class NotesViewController: UIViewController {
    
    let notesSheet: UIView = {
        let textFieldView = UIView()
        let textField = UITextView()
        textFieldView.addSubview(textField)
        textFieldView.backgroundColor = .secondarySystemBackground
        textField.backgroundColor = .systemBackground
        textField.layer.cornerRadius = 18
        textFieldView.layer.cornerRadius = 20
        textField.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        textField.text = "Adicione notas a suas imagens"
        textField.textColor = .secondaryLabel
        textField.textAlignment = .left
        textFieldView.translatesAutoresizingMaskIntoConstraints = false
        textField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-32)
        }
        return textFieldView
    }()
    
    
    override func viewDidLoad() {
          super.viewDidLoad()
          setupNotesView()
        
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
    
}
