////
////  AfterShotViewModel.swift
////  natureza
////
////  Created by Gabriel Puppi on 16/11/21.
////
//
<<<<<<< HEAD
//  AfterShotViewModel.swift
//  natureza
//
//  Created by Gabriel Puppi on 16/11/21.
//

import Foundation
import UIKit




class AfterShotViewModel {
    
    
    let fileManager = FileIOController()
    
    func createNewAlbumWithPhoto(asset: Data) {
        
        var collectionAsset = Collection(images: [])
        collectionAsset.images.append(asset)
        try? fileManager.write(collectionAsset, toDocumentNamed: "Natureza")
        
    }
    
    func addPhotoToAlbum(album: String){
        
    }
    
    func addNoteToPhoto() {
        
        
        
        
    }
    
    
    func savePhoto(image: UIImage){
        
        
        let data = image.pngData()
        
        createNewAlbumWithPhoto(asset: data!)
    }
    
    
    
    func getAlbum() {
        
        
        
        
    }
    
    
    
    
}
=======
//import Foundation
//import UIKit
//
//
//
//
//class AfterShotViewModel {
//
//
//    let fileManager = FileIOController()
//
//    func createNewAlbumWithPhoto(asset: Data) {
//
//        var collectionAsset = Collection(images: [])
//        collectionAsset.images.append(asset)
//        try? fileManager.write(collectionAsset, toDocumentNamed: "Natureza")
//
//    }
//
//    func addPhotoToAlbum(album: String){
//
//    }
//
//
//    func savePhoto(image: UIImage){
//
//
//        let data = image.pngData()
//
//        createNewAlbumWithPhoto(asset: data!)
//    }
//
//
//
//    func getAlbum() {
//
//
//
//
//    }
//
//
//
//
//}
>>>>>>> dev
