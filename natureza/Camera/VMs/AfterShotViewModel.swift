//
//  AfterShotViewModel.swift
//  natureza
//
//  Created by Gabriel Puppi on 16/11/21.
//

import Foundation
import UIKit




class AfterShotViewModel {
    let photosRepository: PhotosRepository = UserDefaultsPhotoRepository.shared
    let collectionsRepository: CollectionsRepository = UsersDefaultCollectionRepository.shared

    func savePhoto(_ photo: Photo){
        photosRepository.SavePhoto(photo)
    }
    
    func savePhotoToCollection(photo: Photo, collection: PhotoCollection) {
        guard let photoId = photo.idFromDate else { return }
        collection.photos.append(photoId)
        collectionsRepository.saveCollection(collection)
    }
}
