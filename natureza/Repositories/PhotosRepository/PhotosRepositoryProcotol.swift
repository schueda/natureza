//
//  PhotosRepositoryProcotol.swift
//  natureza
//
//  Created by André Schueda on 23/11/21.
//

import Foundation

protocol PhotosRepository {
    func SavePhoto(_ photo: Photo)
    func getPhotoById(_ id: String) -> Photo?
}
