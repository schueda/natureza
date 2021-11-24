//
//  HomeViewModel.swift
//  natureza
//
//  Created by André Schueda on 24/11/21.
//

import Foundation
import UIKit

class HomeViewModel {
    let collectionsRepository: CollectionsRepository = UsersDefaultCollectionRepository.shared
    let photosRepository: PhotosRepository = UserDefaultsPhotoRepository.shared
    
    func getAllCollections() -> [PhotoCollection] {
        collectionsRepository.getAllCollections()
    }
    
    func getPhoto(byId id: String) -> UIImage? {
        let photo = photosRepository.getPhotoById(id)
        return photo?.image
    }
}
