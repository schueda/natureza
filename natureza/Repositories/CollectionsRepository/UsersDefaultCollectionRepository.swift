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
    
    private func saveKey(from: PhotoCollection) {
        
    }
    
    private func saveCodable(from: PhotoCollection) {
        
    }
    
    func getAllCollections() {
    }
}
