//
//  PhotosRepositoryProcotol.swift
//  natureza
//
//  Created by André Schueda on 23/11/21.
//

import Foundation
import UIKit

protocol PhotosRepository {
    func SavePhoto(_ photo: Photo)
    func SavePhotos(of collection: PhotoCollection)
    func getPhotoById(_ id: String) -> Photo?
    func getLastPhoto() -> Photo?
    func getPhotos(from collection: PhotoCollection) -> [Photo]
    func getImages(from collection: PhotoCollection) -> [UIImage?]
    
}
