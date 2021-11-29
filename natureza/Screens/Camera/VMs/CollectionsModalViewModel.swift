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
    
    func savePhotoToCollectionBuffer(photo: Photo, collection: PhotoCollection) {
        if photo.note == "Escreva uma nota sobre a imagem" {
            photo.note = ""
        }
        
        collection.photosBuffer?.append(photo)
    }
    
    func savePhotoToCollection(photo: Photo, collection: PhotoCollection) {
        photosRepository.SavePhoto(photo)
        guard let id = photo.idFromDate else { return }
        collection.photosIds.append(id)
        collectionsRepository.saveCollection(collection)
    }
}
