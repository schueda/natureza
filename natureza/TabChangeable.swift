//
//  TabChangeable.swift
//  natureza
//
//  Created by André Schueda on 28/11/21.
//

import Foundation

enum IndexedTab: Int {
    case collections
    case create
    case profile
}

protocol TabChangeable: AnyObject {
    func switchTab(to tab: IndexedTab)
}
