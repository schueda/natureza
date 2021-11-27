//
//  CollectionViewModel.swift
//  natureza
//
//  Created by André Schueda on 24/11/21.
//

import Foundation
import UIKit

class CollectionViewModel {
   
    let collectionsRepository: CollectionsRepository = UserDefaultsCollectionRepository.shared
    let photosRepository: PhotosRepository = UserDefaultsPhotoRepository.shared
    
    func save(collection: PhotoCollection) {
        collectionsRepository.saveCollection(collection)
    }
    
    func getPhotos(from collection: PhotoCollection) -> [Photo] {
        photosRepository.getPhotos(from: collection)
    }
    
    
   
    
}


 
