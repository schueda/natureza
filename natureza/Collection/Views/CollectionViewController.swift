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
        textField.backgroundColor = .red
        textField.layer.cornerRadius = 10
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Nova coleção"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.tintColor]
        
        setupTitleTextField()
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
}
