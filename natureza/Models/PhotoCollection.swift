//
//  PhotoCollection.swift
//  natureza
//
//  Created by André Schueda on 23/11/21.
//

import Foundation

class PhotoCollection {
    var id: UUID
    var name: String
    
    var photos: []
    var notification: Notification
    var note: String?
    
    init(id: UUID = UUID(), name: String, photos: [Photo], notification: Notification, note: String? = nil) {
        self.id = id
        self.name = name
        self.photos = photos
        self.notification = notification
        self.note = note
    }
    
}
