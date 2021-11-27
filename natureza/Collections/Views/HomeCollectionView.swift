//
//  HomeCollectionView.swift
//  natureza
//
//  Created by Gabriel Puppi on 09/11/21.
//
import UIKit
import SnapKit

class HomeCollectionView: UIView {
    let navigationController: UINavigationController?
    let viewModel = HomeViewModel()
    var collections: [PhotoCollection] = []
    
    
    lazy var homeCollection: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = .init(top: 16, left: 0, bottom: 16, right: 0)
        layout.minimumLineSpacing = 24
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collection.backgroundColor = .clear
        collection.showsVerticalScrollIndicator = false
        return collection
    }()
    
    init(frame: CGRect = .zero, navigationController: UINavigationController?) {
        self.navigationController = navigationController
        super.init(frame: frame)
        
        setupHomeCollection()
        reloadCollection()
    }
   
    func reloadCollection() {
        collections = viewModel.getAllCollections()
        homeCollection.reloadData()

    }
    
    func setupHomeCollection() {
        
        addSubview(homeCollection)
        homeCollection.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(CollectionViewController(collection: collections[indexPath.row]), animated: true)
    }
    
}

extension HomeCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = homeCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionViewCell
        let collection = collections[indexPath.row]
        let image = viewModel.getPhoto(byId: collection.photosIds.last ?? "")
        cell.setupCell(image: image, title: collection.name)
        return cell
    }
    
}

extension HomeCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (homeCollection.bounds.width/2) - 12
        let height = width
        return CGSize(width: width, height: height)
    }
}
