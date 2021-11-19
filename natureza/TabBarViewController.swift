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
        
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        
        self.setViewControllers([ getHomeViewController(), getCreateViewController(), getProfileViewController()], animated: false)
    }
    
    private func getHomeViewController() -> UINavigationController {
        let viewController = HomeViewController()
        viewController.tabBarItem = UITabBarItem(title: "Coleções", image: UIImage(systemName: "photo.on.rectangle")!, tag: 0)
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
    
    private func getCreateViewController() -> UINavigationController {
        let viewController = CreateViewController()
        viewController.tabBarItem = UITabBarItem(title: "Criar", image: UIImage(systemName: "plus.circle.fill")!, tag: 1)
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
    
    private func getProfileViewController() -> UINavigationController {
        let viewController =  ProfileVC()
        viewController.tabBarItem = UITabBarItem(title: "Perfil", image: UIImage(systemName: "person")!, tag: 2)
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
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
