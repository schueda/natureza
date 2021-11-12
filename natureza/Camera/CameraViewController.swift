import AVFoundation
import SnapKit
import UIKit
import CameraManager



class CameraViewController: UIViewController {
    
    let cameraManager = CameraManager()
    var imageTaken: UIImage?
    var confirmPhotoView: UIImageView?
    
    var switchCameraButton : UIButton = {
        let button = UIButton()
        let image = UIImage(named: "switchcamera")?.withRenderingMode(.alwaysTemplate)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let captureImageButton : UIButton = {
        let button = UIButton()
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "circle")?.withRenderingMode(.alwaysTemplate)
        button.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        button.tintColor = .white
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(takePhoto), for: .touchUpInside)
        return button
    }()
    
    @objc func takePhoto(){
    
        cameraManager.capturePictureWithCompletion { result in
            switch result {
            case .success(let content):
                self.imageTaken = content.asImage
            
            case .failure:
                print("couldnt take pic")
            }
        }
  }
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCameraView()
        setupCaptureButton()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    func setupCameraView(){
        
        let newView = UIView()
        view.addSubview(newView)
        newView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        let camera = cameraManager
        camera.addPreviewLayerToView(newView)
        
        
    }
    
    func setupCaptureButton() {
        view.addSubview(captureImageButton)
        captureImageButton.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-36)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(32)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-32)
        }
    }
    
    
    
}
