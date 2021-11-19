//
//  TabBarViewController.swift
//  natureza
//
//  Created by Geovanna Kasemirinski da Silva on 17/11/21.
//

import UIKit


import SnapKit


class TabBarViewController: UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    selectedIndex = 0
        
        view.backgroundColor = .systemBrown
        UITabBar.appearance().barTintColor = .systemBackground
       tabBar.tintColor = .label

        tabBarController?.tabBar.backgroundColor = .green
        
        let homeVC = HomeViewController()
        
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "plus.circle.fill")!, tag: 1)
        
        
        let photoVC = PhotoVC()
        photoVC.tabBarItem = UITabBarItem(title: "Coleções", image: UIImage(systemName: "photo.on.rectangle")!, tag: 0)
        
        let profileVC =  ProfileVC()
        profileVC.tabBarItem = UITabBarItem(title: "Perfil", image: UIImage(systemName: "person")!, tag: 2)
        
        self.setViewControllers([ photoVC, homeVC,profileVC], animated: false)
    }
    
}
 



//
class PhotoVC: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
    }
}
    
class ProfileVC: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
    }
}


#if DEBUG
import SwiftUI
struct TabBarViewController_Preview: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPhone 12")
    }

    struct ContentView: UIViewControllerRepresentable {

        func makeUIViewController(context: Context) -> UIViewController {
            UINavigationController(rootViewController: TabBarViewController())
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        }
    }
}
#endif
