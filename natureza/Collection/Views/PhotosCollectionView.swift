//
//  PhotosCollectionView.swift
//  natureza
//
//  Created by André Schueda on 22/11/21.
//

import UIKit

class PhotosCollectionView: UIView {
    var photoCollection: PhotoCollection?
    var navigationController: UINavigationController?
    
    let viewController = CollectionViewController()
    
    var photos: [Photo] = []
    
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
    
    init(frame: CGRect = .zero, collection: PhotoCollection?, navigationController: UINavigationController?) {
        photoCollection = collection
        self.navigationController = navigationController
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
        return photos.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == photos.count {
            let cell = collection.dequeueReusableCell(withReuseIdentifier: "imageButton", for: indexPath) as! AddImageCollectionViewCell
            cell.collection = photoCollection
            cell.navigationController = navigationController
            return cell
        } else {
            let cell = collection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PhotoCollectionViewCell
            
            cell.setupCell(image: photos[indexPath.row].image)
            return cell
        }
    }
}

extension PhotosCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 135, height: collection.bounds.height)
    }
}
