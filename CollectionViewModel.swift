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
        photosRepository.SavePhotos(of: collection)
        
        guard let photos = collection.photosBuffer else { return }
        for photo in photos {
            guard let photoId = photo.idFromDate else { return }
            collection.photosIds.append(photoId)
        }
        
        collectionsRepository.saveCollection(collection)
    }
    
    func getPhotos(from collection: PhotoCollection) -> [Photo] {
        var photos: [Photo] = []
        for id in collection.photosIds {
            guard let photo = photosRepository.getPhotoById(id) else { continue }
            photos.append(photo)
        }
        return photos
    }
    
}
