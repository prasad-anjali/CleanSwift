//
//  SceneDelegate.swift
//  CleanArch
//
//  Created by Anjali Prasad on 19/04/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        configureWindow()
    }
    
    private func configureWindow() {
        let navController = MovieNavigation()
        window?.rootViewController = navController
        Task {
            await navController.setViewController(for:.search)
            
        }
        window?.makeKeyAndVisible()
    }
    
}

