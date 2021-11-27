//  CollectionsModalViewModel.swift
//
//  natureza
//
//  Created by André Schueda on 25/11/21.
//

import Foundation

class CollectionsModalViewModel {
    let collectionsRepository: CollectionsRepository = UserDefaultsCollectionRepository.shared
    let photosRepository: PhotosRepository = UserDefaultsPhotoRepository.shared
    
    func getAllCollections() -> [PhotoCollection] {
        collectionsRepository.getAllCollections()
    }
    
    func getPhoto(from collection: PhotoCollection) -> Photo? {
        guard let photoId = collection.photosIds.last else { return nil }
        return photosRepository.getPhotoById(photoId)
    }
    
    func savePhoto(_ photo: Photo) {
        photosRepository.SavePhoto(photo)
    }
    
    func savePhotoToCollectionBuffer(photo: Photo, collection: PhotoCollection) {
        collection.photosBuffer?.append(photo)
    }
}
