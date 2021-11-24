//
//  UsersDefaultCollectionRepository.swift
//  natureza
//
//  Created by André Schueda on 23/11/21.
//

import Foundation

class UsersDefaultCollectionRepository: CollectionsRepository {
    static let shared = UsersDefaultCollectionRepository()
    
    private init() {}
    
    private static let collectionsKey = "COLLECTIONS"
    
    func saveCollection(_ photoCollection: PhotoCollection) {
        saveKey(from: photoCollection)
        saveCodable(from: photoCollection)
        
    }
    
    private func saveKey(from collection: PhotoCollection) {
        var keys = getKeys()
        if keys.firstIndex(of: collection.id.uuidString) == nil {
            keys.append(collection.id.uuidString)
        }
        UserDefaults.standard.setValue(keys, forKey: Self.collectionsKey)
    }
    
    private func getKeys() -> [String] {
        let keys = UserDefaults.standard.array(forKey: Self.collectionsKey) as? [String]
        
        if let keys = keys {
            return keys
        }
        
        return []
    }
    
    private func saveCodable(from photo: PhotoCollection) {
        do {
            let photoData = try JSONEncoder().encode(photo)
            UserDefaults.standard.setValue(photoData, forKey: photo.id.uuidString)
        } catch let err {
            print("failed saving art: \(err)")
        }
    }
    
    func getAllCollections() {
    }
}
