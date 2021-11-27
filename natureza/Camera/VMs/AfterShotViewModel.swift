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
    let collectionsRepository: CollectionsRepository = UserDefaultsCollectionRepository.shared

    func savePhoto(_ photo: Photo){
        photosRepository.SavePhoto(photo)
    }
    
    func savePhotoToCollectionBuffer(photo: Photo, collection: PhotoCollection) {
        collection.photosBuffer?.append(photo)
    }
}
