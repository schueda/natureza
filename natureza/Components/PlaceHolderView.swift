//
//  PlaceHolderView.swift
//  natureza
//
//  Created by André Schueda on 27/11/21.
//

import UIKit

class PlaceHolderView: UIView {
    let title: String
    let text: String
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = title
        label.textColor = .tintColor
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 22, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = text
        label.textColor = .tintColor
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Natour Logo-\(UIColor.tintColor.cgColor.hashValue)")
        return imageView
    }()
    
    init(frame: CGRect = .zero, title: String, text: String) {
        self.title = title
        self.text = text
        super.init(frame: frame)
        
        setupView()
        setupTitleLabel()
        setupTextLabel()
        setupLogoImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        layer.cornerRadius = 20
        backgroundColor = .secondarySystemBackground
    }
    
    func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-32)
        }
    }
    
    func setupTextLabel() {
        addSubview(textLabel)
        textLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(64)
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-32)
        }
    }
    
    func setupLogoImageView() {
        addSubview(logoImageView)
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-200)
            make.width.equalTo(175)
            make.height.equalTo(175)
        }
    }
}
