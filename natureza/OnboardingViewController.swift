//
//  OnboardingViewController.swift
//  natureza
//
//  Created by Geovanna Kasemirinski da Silva on 19/11/21.
//

import UIKit

class OnboardingViewController: UIPageViewController {

    var pages = [UIViewController]()
    let pageControl =
    
    lazy var onboardingRect: UIView = {
        let rect = UIView()
        rect.backgroundColor = .systemYellow
        return rect
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Próximo", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 24
        button.titleLabel?.font = .systemFont(ofSize: 17)
        //button.addTarget(self, action: #selector(openCamera), for: .touchUpInside)
        return button
    }()
 
    lazy var onboardingTitle: UILabel = {
        let titleOnboarding = UILabel()
        let titlesText = ["Faça uma pausa na rotina", "Acompanhe as mudanças", "Registre o crescimento", "Tenha coleções da natureza", "Crie edições incríveis", "Compartilhecom o mundo"]
        
        titleOnboarding.font = .systemFont(ofSize: 34, weight: .bold)
        
        return titleOnboarding
    }()
    

    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//    }
    
//    private func setupOnboardingRect() {
//        addSubview(rec
//        }
//    }
    
    
}


