//
//  Image.swift
//  natureza
//
//  Created by André Schueda on 23/11/21.
//

import Foundation
import UIKit

class Photo: Codable {
    var date = Date()
    var idFromDate: String? {
        "\(date.timeIntervalSince1970)"
    }
    
    var note: String?
    var image: UIImage?
    
    init(note: String? = nil, image: UIImage?) {
        self.note = note
        self.image = image
    }
    
    enum CodingKeys: CodingKey {
        case date
        case note
    }
    
}
