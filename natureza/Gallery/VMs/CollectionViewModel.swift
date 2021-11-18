//
//  CollectionsViewModel.swift
//  natureza
//
//  Created by Gabriel Puppi on 17/11/21.
//

import Foundation



class CollectionViewModel {
    
  var collectionRetrieve = Collection(images: [])
    
    
    func retrieveImages() {
        
        do {
            let documentURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let Path = documentURL.appendingPathComponent("Natureza").absoluteURL
            let directoryContents = try FileManager.default.contentsOfDirectory(at: Path, includingPropertiesForKeys: nil, options: [])
            print(directoryContents)
        }
        catch {
            print(error.localizedDescription)
        }
        
    }
    
    
    
    
    
 




}
