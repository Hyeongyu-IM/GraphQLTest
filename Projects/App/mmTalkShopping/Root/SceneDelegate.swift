//
//  SceneDelegate.swift
//  mmTalkShopping
//
//  Created by 임현규 on 11/28/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        self.window = .init(windowScene: windowScene)
        self.window?.rootViewController = RootNavigationContoller()
        self.window?.makeKeyAndVisible()
    }
}

