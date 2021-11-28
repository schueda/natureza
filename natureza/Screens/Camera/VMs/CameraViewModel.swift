//
//  cameraViewModel.swift
//  natureza
//
//  Created by Gabriel Puppi on 12/11/21.
//

import Foundation
import CameraManager
import Photos

protocol CameraViewModelDelegate: AnyObject {
}

class CameraViewModel: CameraViewModelDelegate {
    let photosRepository: PhotosRepository = UserDefaultsPhotoRepository.shared
    let collectionsRepository: CollectionsRepository = UserDefaultsCollectionRepository.shared
    
    let cameraManager = CameraManager()
    var imageTaken: UIImage?
    weak var delegate: CameraViewModelDelegate?
    
    func startCamera() {
        cameraManager.resumeCaptureSession()
        cameraManager.captureSession?.automaticallyConfiguresCaptureDeviceForWideColor = true
        cameraManager.writeFilesToPhoneLibrary = false
        cameraManager.cameraOutputQuality = .hd1920x1080
        cameraManager.shouldRespondToOrientationChanges = false
        
        
    }
    
    func stopCamera() {
        cameraManager.stopCaptureSession()
    }
    
    func switchCamera(){
        switch cameraManager.cameraDevice {
        case .back:
            cameraManager.cameraDevice = .front
        case .front:
            cameraManager.cameraDevice = .back
        }
    }
    
    func setOverlay(with collection: PhotoCollection?) -> UIImage? {
        if let collection = collection {
            if let photoBuffer = collection.photosBuffer {
                if !(photoBuffer.isEmpty) {
                    return photoBuffer.last?.image
                }
            }
            if let lastSavedPhotoId = collection.photosIds.last {
                return photosRepository.getPhotoById(lastSavedPhotoId)?.image
            }
        }
        return photosRepository.getLastPhoto()?.image
    }
    
    func takePhoto(completion: @escaping () -> Void){
        cameraManager.capturePictureWithCompletion { result in
            switch result {
            case .success(let content):
                self.imageTaken = content.asImage
            case .failure:
                print("couldnt take pic")
            }
            completion()
        }
    }
    
    func savePhotoToCollectionBuffer(photo: Photo, collection: PhotoCollection) {
        if photo.note == "Escreva uma nota sobre a imagem" {
            photo.note = ""
        }
        
        collection.photosBuffer?.append(photo)
    }
}


