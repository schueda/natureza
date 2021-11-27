//
//  CollectionTableViewCell.swift
//  natureza
//
//  Created by André Schueda on 25/11/21.
//

import UIKit

class CollectionTableViewCell: UITableViewCell {
    lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .tertiarySystemBackground
        view.layer.cornerRadius = 10
        
        return view
    }()
    
    lazy var previewImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 3
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var collectionTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .tintColor
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    lazy var chevronImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .tintColor
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        
        setupBackView()
        setupPreviewImageView()
        setupLabel()
        setupChevron()
    }
    
    func setupBackView() {
        addSubview(backView)
        backView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-10)
            make.height.equalTo(60)
        }
    }
    
    func setupPreviewImageView() {
        backView.addSubview(previewImageView)
        previewImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(30)
        }
    }
    
    func setupLabel() {
        backView.addSubview(collectionTitleLabel)
        collectionTitleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(backView.snp.centerY).offset(6)
            make.leading.equalTo(previewImageView.snp.trailing).offset(10)
            make.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(16)
        }
    }
    
    func setupChevron() {
        backView.addSubview(chevronImageView)
        chevronImageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
            make.width.equalTo(12)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCell(image: UIImage?, text: String) {
        previewImageView.image = image
        collectionTitleLabel.text = text
    }

}
