import AVFoundation
import SnapKit
import UIKit
import CameraKit_iOS



class CameraViewController: UIViewController {

    let switchCameraButton : UIButton = {
        let button = UIButton()
        let image = UIImage(named: "switchcamera")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
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
        return button
    }()
    
 override func viewDidLoad() {
        super.viewDidLoad()
        setupCameraView()
        setupCaptureButton()

        // Do any additional setup after loading the view.
    }
    

    
    func setupCameraView(){
        let session = CKFPhotoSession()
        let preview = CKFPreviewView()
        preview.translatesAutoresizingMaskIntoConstraints = false
        preview.session = session
        view.addSubview(preview)
        
        preview.snp.makeConstraints { make in
            make.height.greaterThanOrEqualToSuperview()
            make.width.greaterThanOrEqualToSuperview()
            make.center.equalToSuperview()
            
        }
   }
    
    func setupCaptureButton() {
        view.addSubview(captureImageButton)
        captureImageButton.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-48)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(32)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-32)
        }
       }
    
   

}
