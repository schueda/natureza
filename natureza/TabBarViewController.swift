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
        tabBar.tintColor = .tintColor
        
        self.setViewControllers([ getHomeViewController(), getCreateViewController(), getProfileViewController()], animated: false)
    }
    
    private func getHomeViewController() -> UINavigationController {
        let viewController = HomeViewController(viewModel: HomeViewModel())
        viewController.tabBarItem = UITabBarItem(title: "Coleções", image: UIImage(systemName: "photo.on.rectangle")!, tag: 0)
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
    
    private func getCreateViewController() -> UINavigationController {
        let viewController = CreateViewController()
        viewController.tabBarItem = UITabBarItem(title: "Criar", image: UIImage(systemName: "plus.circle")!, tag: 1)
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
    
    private func getProfileViewController() -> UINavigationController {
        let viewController =  ProfileViewController()
        viewController.tabBarItem = UITabBarItem(title: "Perfil", image: UIImage(systemName: "person")!, tag: 2)
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
}
    
