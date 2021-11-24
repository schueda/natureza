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
    
    private func saveCodable(from collection: PhotoCollection) {
        do {
            let collectionData = try JSONEncoder().encode(collection)
            UserDefaults.standard.setValue(collectionData, forKey: collection.id.uuidString)
        } catch let err {
            print("failed saving collection: \(err)")
        }
    }
    
    func getAllCollections() -> [PhotoCollection] {
        var collections: [PhotoCollection] = []
        let keys = getKeys()
        for key in keys {
            guard let collection = getCollection(forKey: key) else { continue }
            collections.append(collection)
        }
        return collections
    }
    
    private func getCollection(forKey key: String) -> PhotoCollection? {
        do {
            guard let collectionData = UserDefaults.standard.data(forKey: key) else { return nil }
            let collection = try JSONDecoder().decode(PhotoCollection.self, from: collectionData)
            return collection
            
        } catch let err {
            print("Error getting collection: \(err)")
            return nil
        }
    }
}
