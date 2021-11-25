//
//  CollectionViewModel.swift
//  natureza
//
//  Created by André Schueda on 24/11/21.
//

import Foundation

class CollectionViewModel {
    let collectionsRepository: CollectionsRepository = UserDefaultsCollectionRepository.shared
    let photosRepository: PhotosRepository = UserDefaultsPhotoRepository.shared
    
    func save(collection: PhotoCollection) {
        collectionsRepository.saveCollection(collection)
    }
    
    func getPhotos(from collection: PhotoCollection) -> [Photo] {
        var photos: [Photo] = []
        for id in collection.photos {
            guard let photo = photosRepository.getPhotoById(id) else { continue }
            photos.append(photo)
        }
        return photos
    }
}
