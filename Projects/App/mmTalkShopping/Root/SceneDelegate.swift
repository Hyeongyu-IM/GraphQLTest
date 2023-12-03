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
        
#if DEBUG
        let isUnitTesting = ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil
        guard !isUnitTesting else { return }
#endif
        
        self.window = .init(windowScene: windowScene)
        self.window?.rootViewController = RootNavigationContoller()
        self.window?.makeKeyAndVisible()
    }
}

