//
//  CollectionsRepositoryProtocol.swift
//  natureza
//
//  Created by André Schueda on 23/11/21.
//

import Foundation

protocol CollectionsRepository {
    func saveCollection(_ photoCollection: PhotoCollection)
    func getAllCollections() -> [PhotoCollection]
    
}
