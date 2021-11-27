//
//  PhotoViewModel.swift
//  natureza
//
//  Created by André Schueda on 27/11/21.
//

import Foundation

class PhotoViewModel {
    let photosRepository: PhotosRepository = UserDefaultsPhotoRepository.shared
    
    func save(photo: Photo) {
        photosRepository.SavePhoto(photo)
    }
}
