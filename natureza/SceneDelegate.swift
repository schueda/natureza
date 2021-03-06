//
//  SceneDelegate.swift
//  natureza
//
//  Created by André Schueda on 08/11/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    static weak var appTab: TabChangeable?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
        
        let tab = TabBarViewController()
        window?.rootViewController = tab
        Self.appTab = tab
        
        let tintColor = getColorBySeason()
        window?.tintColor = tintColor
        window?.overrideUserInterfaceStyle = .dark
    }
    
    private func getColorBySeason() -> UIColor {
        let calendar = Calendar(identifier: .gregorian)
        let current =  calendar.dateComponents([.year], from: Date())
        
        var autumnBegin = DateComponents()
        autumnBegin.year = current.year
        autumnBegin.month = 3
        autumnBegin.day = 21
        autumnBegin.timeZone = TimeZone(abbreviation: "GMT")
        guard let autumnDate = calendar.date(from: autumnBegin) else { return .appYellow }
        
        var winterBegin = DateComponents()
        winterBegin.year = current.year
        winterBegin.month = 6
        winterBegin.day = 21
        winterBegin.timeZone = TimeZone(abbreviation: "GMT")
        guard let winterDate = calendar.date(from: winterBegin) else { return .appYellow }
        
        var springBegin = DateComponents()
        springBegin.year = current.year
        springBegin.month = 9
        springBegin.day = 22
        springBegin.timeZone = TimeZone(abbreviation: "GMT")
        guard let springDate = calendar.date(from: springBegin) else { return .appYellow }
        
        var summerBegin = DateComponents()
        summerBegin.year = current.year
        summerBegin.month = 12
        summerBegin.day = 21
        summerBegin.timeZone = TimeZone(abbreviation: "GMT")
        guard let summerDate = calendar.date(from: summerBegin) else { return .appYellow }
        
        let date = Date()
        if date < autumnDate {
            //verao
            return .appYellow
        } else if date < winterDate {
            //outono
            return .appBrown
        } else if date < springDate {
            //inverno
            return .appBlue
        } else if date < summerDate {
            //primavera
            return .appGreen
        } else {
            //verao
            return .appYellow
        }
        
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
}

