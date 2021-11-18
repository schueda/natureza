//
//  HomeCollectionView.swift
//  natureza
//
//  Created by Gabriel Puppi on 09/11/21.
//
import UIKit
import SnapKit

class HomeCollectionView: UIView {
    
   

    lazy var homeCollection: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collection.backgroundColor = .clear
        return collection
    }()
    
  override init(frame: CGRect) {
        super.init(frame: frame)
      
      setupHomeCollection()
      
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
    
}

extension HomeCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = homeCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionViewCell
        cell.setupCell(UIImage(named: "testImage")!)
        return cell
    }

}

extension HomeCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (homeCollection.bounds.width/2) - 8
        let height = width
        return CGSize(width: width, height: height)
    }
}
