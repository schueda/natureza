//
//  PhotosCollectionView.swift
//  natureza
//
//  Created by André Schueda on 22/11/21.
//

import UIKit

class PhotosCollectionView: UIView {
    let count = 1
    
    lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        layout.minimumInteritemSpacing = 8
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collection.register(AddImageCollectionViewCell.self, forCellWithReuseIdentifier: "imageButton")
        collection.backgroundColor = .clear
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCollection()
    }
    
    private func setupCollection() {
        addSubview(collection)
        collection.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PhotosCollectionView: UICollectionViewDelegate {
    
}

extension PhotosCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //Quantidade de imagens do data source + 1
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == count - 1 {
            let cell = collection.dequeueReusableCell(withReuseIdentifier: "imageButton", for: indexPath) as! AddImageCollectionViewCell
            return cell
        } else {
            let cell = collection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PhotoCollectionViewCell
            cell.setupCell(image: UIImage(named: "testImage")!)
            return cell
        }
    }
}

extension PhotosCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 135, height: collection.bounds.height)
    }
}
