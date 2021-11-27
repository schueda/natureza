import AVFoundation
import SnapKit
import UIKit
import CameraManager




class CameraViewController: UIViewController {
    let collection: PhotoCollection?
    
    let viewModel = CameraViewModel()
    var confirmPhotoView: UIImageView?

    var isOverlayed = false
    
    lazy var overlayView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = viewModel.setOverlay(with: collection)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.alpha = 0.0
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var flashButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "bolt.slash.fill"), for: .normal)
        button.setTitle("Off", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12)
        button.alignTextBelow()
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(toggleFlash), for: .touchUpInside)
        return button
    }()
    
    lazy var overlayButton : UIButton = {
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
    
    lazy var exitCameraButton: UIButton = {
        let button = UIButton()
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "xmark")?.withRenderingMode(.alwaysTemplate)
        button.addSubview(imageView)
        button.tintColor = .white
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            
        }
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(dismissCamera), for: .touchUpInside)
        
        
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
    
    lazy var afterShotView: AfterShotView = {
        let view = AfterShotView(collection: collection, navigationController: navigationController, viewModel: viewModel)
        view.alpha = 0
        return view
    }()
    
    
    @objc func dismissCamera() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func toggleFlash() {
        switch viewModel.cameraManager.flashMode {
        case .auto:
            viewModel.cameraManager.flashMode = .on
            flashButton.setImage(UIImage(systemName:"bolt.fill"), for: .normal)
            flashButton.setTitle("On", for: .normal)
        case .on:
            viewModel.cameraManager.flashMode = .off
            flashButton.setImage(UIImage(systemName:"bolt.slash.fill"), for: .normal)
            flashButton.setTitle("Off", for: .normal)
        case.off:
            viewModel.cameraManager.flashMode = .auto
            flashButton.setImage(UIImage(systemName:"bolt.badge.a"), for: .normal)
            flashButton.setTitle("Auto", for: .normal)
        }
    }
    
    @objc func takePhoto() {
        viewModel.takePhoto() {
            self.showAfterShot()
        }
    }
    
    private func showAfterShot() {
        viewModel.stopCamera()
        afterShotView.image = viewModel.imageTaken
        afterShotView.alpha = 1
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
        view.backgroundColor = .secondarySystemBackground
        setupCameraView()
        setupDismissButton()
        setupCaptureButton()
        setupFlashButton()
        setupOverlayButton()
        setOverlayView()
        setupAfterShot()
        
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.startCamera()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        viewModel.stopCamera()
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
    
    func setupFlashButton() {
        view.addSubview(flashButton)
        flashButton.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-32)
            make.centerX.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-64)
        }
    }
    
    func setupOverlayButton() {
        view.addSubview(overlayButton)
        overlayButton.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-32)
            make.centerX.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(64)
        }
    }
    
    func setupDismissButton(){
        view.addSubview(exitCameraButton)
        exitCameraButton.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.top.equalTo(48)
            make.leading.equalTo(32)
        }
    }
    
    private func setupAfterShot() {
        view.addSubview(afterShotView)
        afterShotView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
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
