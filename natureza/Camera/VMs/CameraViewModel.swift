//
//  cameraViewModel.swift
//  natureza
//
//  Created by Gabriel Puppi on 12/11/21.
//

import Foundation
import CameraManager

protocol CameraViewModelDelegate: AnyObject {
    
    
    
}

class CameraViewModel: CameraViewModelDelegate {
    
    let cameraManager = CameraManager()
    var imageTaken: UIImage?
    weak var delegate: CameraViewModelDelegate?
    
    
    func startCamera() {
        cameraManager.resumeCaptureSession()
        cameraManager.captureSession?.automaticallyConfiguresCaptureDeviceForWideColor = true
        cameraManager.writeFilesToPhoneLibrary = false
   }
    
    func stopCamera() {
        
        cameraManager.stopCaptureSession()
        
    }
    
        
    func switchCamera(){
        
        
        
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
}


