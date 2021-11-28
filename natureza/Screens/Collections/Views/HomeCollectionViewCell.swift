
//
//  HomeCollectionViewCell.swift
//  natureza
//
//  Created by Gabriel Puppi on 09/11/21.
//
import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    lazy var cellView: UIView = {
        
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        
        return view
    }()
    
    
    lazy var cellImage: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .secondarySystemBackground
        
        return imageView
        
    }()
    
    lazy var cellLabel: UILabel = {
        let labelPlaceHolder = "Place Holder"
        let label = UILabel()
        label.text = labelPlaceHolder
        label.font = .systemFont(ofSize: 10, weight: .bold)
        label.textColor = .systemBackground
        label.textAlignment = .left
        
        return label
    }()
    
    
    lazy var cellRect: UIView = {
        let rect = UIView()
        rect.backgroundColor = .tintColor
        return rect
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCellView()
        setupCellImage()
        setupCellRect()
        setupCellLabel()
    }
    
    private func setupCellView() {
        addSubview(cellView)
        cellView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupCellImage() {
        
        cellView.addSubview(cellImage)
        cellImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupCellRect() {
        cellView.addSubview(cellRect)
        cellRect.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(bounds.height * 0.2)
            
        }
    }
    
    private func setupCellLabel() {
        
        cellRect.addSubview(cellLabel)
        cellLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
    }
    
    
    func setupCell(image: UIImage?, title: String) {
        cellImage.image = image
        cellLabel.text = title
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}


