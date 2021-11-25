import AVFoundation
import SnapKit
import UIKit
import CameraManager




class CameraViewController: UIViewController {
    let collection: PhotoCollection?
    
    let viewModel = CameraViewModel()
    var confirmPhotoView: UIImageView?
    var overlayView = UIImageView()
    
    lazy var configFlashButton : UIButton = {
        let button = UIButton()
        let imageView = UIImageView()
        button.setImage(UIImage(systemName: "bolt.slash.fill"), for: .normal)
        button.setTitle("Off", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12)
        button.alignTextBelow()
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(toggleFlash), for: .touchUpInside)
        return button
    }()
    
    lazy var setOverlayButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "leaf.fill"), for: .normal)
        button.setTitle("Overlay", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12)
        button.alignTextBelow()
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(showOverlay), for: .touchUpInside)
        return button
    }()
    
    lazy var captureImageButton : UIButton = {
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
    
    var isOverlayed = false
    
    
    @objc func toggleFlash() {
        
        switch viewModel.cameraManager.flashMode {
            
        case .auto:
            viewModel.cameraManager.flashMode = .on
            configFlashButton.setImage(UIImage(systemName:"bolt.fill"), for: .normal)
            configFlashButton.setTitle("On", for: .normal)
            
        case .on:
            viewModel.cameraManager.flashMode = .off
            configFlashButton.setImage(UIImage(systemName:"bolt.slash.fill"), for: .normal)
            configFlashButton.setTitle("Off", for: .normal)
            
        case.off:
            viewModel.cameraManager.flashMode = .auto
            configFlashButton.setImage(UIImage(systemName:"bolt.badge.a"), for: .normal)
            configFlashButton.setTitle("Auto", for: .normal)
        }
        
    }
    
    
    @objc func takePhoto() {
        
        viewModel.takePhoto() {
            
            self.setupAfterShot()
        }
    }
    
    @objc func showOverlay() {
        
        if isOverlayed == false {
            overlayView.layer.opacity = 0.3
            isOverlayed = true
        } else {
            
            overlayView.layer.opacity = 0.0
            isOverlayed = false
            
        }
    }
    
    init(collection: PhotoCollection? = nil) {
        self.collection = collection
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCameraView()
        setupCaptureButton()
        setupConfigCameraButton()
        setupSetOverlayButton()
        setOverlayView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.startCamera()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        viewModel.stopCamera()
    }
    
    
    func setupAfterShot() {
        guard let image = viewModel.imageTaken else { return }
        viewModel.stopCamera()
        navigationController?.pushViewController(AfterShotViewController(image: image, collection: collection), animated: false)
    }
    
    func setupCameraView(){
        let newView = UIView()
        view.addSubview(newView)
        newView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        viewModel.cameraManager.addPreviewLayerToView(newView)
        
    }
    
    func setOverlayView() {
        
        overlayView.image = viewModel.setOverlay()
        overlayView.contentMode = .scaleAspectFill
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        overlayView.layer.opacity = 0.0
        view.addSubview(overlayView)
        overlayView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setupCaptureButton() {
        view.addSubview(captureImageButton)
        captureImageButton.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-32)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(72)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-72)
        }
    }
    
    func setupConfigCameraButton() {
        view.addSubview(configFlashButton)
        configFlashButton.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-32)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-32)
        }
        
    }
    
    func setupSetOverlayButton() {
        view.addSubview(setOverlayButton)
        setOverlayButton.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-32)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(96)
        }
        
    }
    
    
    
}
public extension UIButton {
    
    func alignTextBelow(spacing: CGFloat = 6.0)
    {
        if let image = self.imageView?.image
        {
            let imageSize: CGSize = image.size
            self.titleEdgeInsets = UIEdgeInsets(top: spacing, left: -imageSize.width, bottom: -(imageSize.height), right: 0.0)
            let labelString = NSString(string: self.titleLabel!.text!)
            let titleSize = labelString.size(withAttributes: [NSAttributedString.Key.font: self.titleLabel!.font])
            self.imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + spacing), left: 0.0, bottom: 0.0, right: -titleSize.width)
        }
    }
}
