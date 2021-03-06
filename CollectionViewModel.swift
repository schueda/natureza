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
        photosRepository.SavePhotos(of: collection)
        
        guard let photos = collection.photosBuffer else { return }
        for photo in photos {
            guard let photoId = photo.idFromDate else { return }
            collection.photosIds.append(photoId)
        }
        
        if collection.note == "Escreva uma nota sobre a coleção" {
            collection.note = ""
        }
        
        collectionsRepository.saveCollection(collection)
    }
    
    func getPhotos(from collection: PhotoCollection) -> [Photo] {
        photosRepository.getPhotos(from: collection)
    }
    
    
   
    
}


 
