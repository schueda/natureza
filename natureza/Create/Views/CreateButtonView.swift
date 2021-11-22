//
//  CreateButtonView.swift
//  natureza
//
//  Created by André Schueda on 19/11/21.
//

import UIKit

class CreateButtonView: UIView {
    let text: String
    
    lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()
    
    lazy var buttonLabel: UILabel = {
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var plusImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "plus")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    init(frame: CGRect = .zero, text: String) {
        self.text = text
        super.init(frame: frame)
        
        isUserInteractionEnabled = false
        
        setupStack()
        [
            buttonLabel,
            plusImage
        ].forEach({stack.addArrangedSubview($0)})
        setupPlusImage()
    }
    
    private func setupStack() {
        addSubview(stack)
        stack.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.center.equalToSuperview()
        }
    }
    
    private func setupPlusImage() {
        plusImage.snp.makeConstraints { make in
            make.height.equalTo(25)
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
