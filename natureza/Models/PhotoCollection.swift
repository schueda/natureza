//
//  PhotoCollection.swift
//  natureza
//
//  Created by André Schueda on 23/11/21.
//

import Foundation

class PhotoCollection: Codable {
    var id: UUID
    var name: String
    
    var photosBuffer: [Photo]? = []
    var photosIds: [String] = []
    var notification: Notification?
    var note: String
    
    init(id: UUID = UUID(), name: String, photos: [String], notification: Notification, note: String) {
        self.id = id
        self.name = name
        self.photosIds = photos
        self.notification = notification
        self.note = note
    }
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case photosIds
        case note
    }
    
}
