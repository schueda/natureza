//
//  HomeCollectionViewCell.swift
//  natureza
//
//  Created by Gabriel Puppi on 09/11/21.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    lazy var cellImage: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        
        return imageView
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCellImage()
    }
    
    private func setupCellImage() {
        addSubview(cellImage)
        cellImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setupCell(_ image: UIImage) {
        cellImage.image = image
 }
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}



