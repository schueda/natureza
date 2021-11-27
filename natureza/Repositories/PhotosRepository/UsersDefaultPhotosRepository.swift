//
//  UsersDefaultPhotosRepository.swift
//  natureza
//
//  Created by André Schueda on 23/11/21.
//

import Foundation
import UIKit

class UserDefaultsPhotoRepository: PhotosRepository {
    
    static let shared = UserDefaultsPhotoRepository()
    
    private init() {}
    
    private static let photosKey = "PHOTOS"
    
    func SavePhoto(_ photo: Photo) {
        saveKey(from: photo)
        saveCodable(from: photo)
        saveImage(from: photo)
    }
    
    func SavePhotos(of collection: PhotoCollection) {
        guard let photos = collection.photosBuffer else { return }
        for photo in photos {
            SavePhoto(photo)
        }
    }
    
    private func saveKey(from photo: Photo) {
        
        var keys = getKeys()
        guard let id = photo.idFromDate else { return }
        if keys.firstIndex(of: id) == nil{
            keys.append(id)
        }
        UserDefaults.standard.setValue(keys, forKey: Self.photosKey)
    }
    
    private func getKeys() -> [String] {
        let keys = UserDefaults.standard.array(forKey: Self.photosKey) as? [String]
        
        if let keys = keys {
            return keys
        }
        
        return []
    }
    
    private func saveCodable(from photo: Photo) {
        do {
            let photoData = try JSONEncoder().encode(photo)
            guard let id = photo.idFromDate else { return }
            UserDefaults.standard.setValue(photoData, forKey: id)
        } catch let err {
            print("failed saving photo: \(err)")
        }
    }
    
    private func saveImage(from photo: Photo) {
        guard let image = photo.image,
              let id = photo.idFromDate,
              var imageData = image.jpegData(compressionQuality: 1)
        else { return }
        
        if imageData.isEmpty {
            guard let pngdata = image.pngData() else { return }
            imageData = pngdata
        }
        
        do  {
            guard let imageURL = getImageURL(forKey: id) else { return }
            try imageData.write(to: imageURL, options: .atomic)
        } catch let err {
            print("Saving image resulted in error: \(err)")
        }
    }
    
    private func getImageURL(forKey key: String) -> URL? {
        guard let imageURL = FileManager.default.urls(for: .documentDirectory,
                                                         in: FileManager.SearchPathDomainMask.userDomainMask).first
        else { return nil }
        return imageURL.appendingPathComponent("\(key)-image")
    }

    
    func getPhotoById(_ id: String) -> Photo? {
        guard let photo = getEncodablePhoto(forKey: id) else { return nil }
        photo.image = getPhotoImage(forKey: id)
        
        return photo
    }
    
    private func getEncodablePhoto(forKey key: String) -> Photo? {
        do {
            guard let photoData = UserDefaults.standard.data(forKey: key) else { return nil }
            let art = try JSONDecoder().decode(Photo.self, from: photoData)
            return art
            
        } catch let err {
            print("Error getting photo: \(err)")
            return nil
        }
    }
    
    private func getPhotoImage(forKey key: String) -> UIImage? {
        guard let imageURL = getImageURL(forKey: key),
              let imageData = FileManager.default.contents(atPath: imageURL.path)
        else { return nil }
        
        return UIImage(data: imageData)
    }

    func getLastPhoto() -> Photo? {
        let keys = getKeys()
        guard let lastImage = keys.last else { return nil }
        return getPhotoById(lastImage)
    }
    
    func getPhotos(from collection: PhotoCollection) -> [Photo] {
        var photos: [Photo] = []
        for id in collection.photosIds {
            guard let photo = getPhotoById(id) else { continue }
            photos.append(photo)
        }
        return photos
    }
    
    func getImages(from collection: PhotoCollection) -> [UIImage?] {
        getPhotos(from: collection).map { $0.image }
    }
    
}
