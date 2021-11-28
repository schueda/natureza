//
//  CreateButtonView.swift
//  natureza
//
//  Created by André Schueda on 19/11/21.
//

import UIKit

class CreateButtonView: UIView {
    let text: String
    let image: UIImage?
    
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
        label.textColor = .secondarySystemBackground
        return label
    }()
    
    lazy var plusImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.tintColor = .secondarySystemBackground
        return imageView
    }()
    
    init(frame: CGRect = .zero, text: String, image: UIImage?) {
        self.text = text
        self.image = image
        super.init(frame: frame)
        
        backgroundColor = .tintColor.withAlphaComponent(0.6)
        layer.cornerRadius = 10
        layer.borderColor = UIColor.tintColor.cgColor
        layer.borderWidth = 2
        
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
