//
//  Image.swift
//  natureza
//
//  Created by André Schueda on 23/11/21.
//

import Foundation
import UIKit

class Photo {
    let date = Date()
    var idFromDate: String {
        "\(date.timeIntervalSince1970)"
    }
    
    let note: String?
    let image: UIImage
    
    init(note: String? = nil, image: UIImage) {
        self.note = note
        self.image = image
    }
    
    
}
