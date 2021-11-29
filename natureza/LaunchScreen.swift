//
//  SplashViewController.swift
//  natureza
//
//  Created by Geovanna Kasemirinski da Silva on 26/11/21.
//

import UIKit

class LaunchScreen:  UIViewController {
    
    @objc lazy var viewBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .tintColor
        
        return view
    }()
    
    lazy var logoNatour: UIImageView = {
        let logo = UIImageView()
        //logo.contentMode = .scaleAspectFill
        logo.clipsToBounds = true
        logo.image = UIImage(named: "Logo terciária - Natour")
        return logo
    }()
    
    lazy var imageNatour: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image = UIImage(named: "SímboloNatour",in: Bundle(for: type(of: self)), compatibleWith: nil)
        return image
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewBackground()
        setupLogoNatour()
        setupImageNatour()
        spinImage()
        
        navegation()
    }
    
    
    private func setupViewBackground(){
        view.addSubview(viewBackground)
        viewBackground.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupLogoNatour(){
        viewBackground.addSubview(logoNatour)
        logoNatour.snp.makeConstraints { make in
            make.center.equalToSuperview()
            //            make.top.equalTo(346)
            //            make.bottom.equalTo(434)
            //            make.right.equalTo(55)
            //            make.left.equalTo(55)
        }
    }
    
    
    private func setupImageNatour(){
        viewBackground.addSubview(imageNatour)
        imageNatour.snp.makeConstraints { make in
            make.center.equalToSuperview()
            
        }
    }
    
    var count = 0
    func spinImage(){
        
        
        UIView.animate(withDuration: 4.0, animations: {
            self.imageNatour.transform = CGAffineTransform(rotationAngle: (180.0 * .pi) / 180.0)
        })
        
        
    }
    
    
    func navegation(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.navigationController?.pushViewController(OnboardingViewController(), animated: true)
        }
        
        
    }
    
    
}
