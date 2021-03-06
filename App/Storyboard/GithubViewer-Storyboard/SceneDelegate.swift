//
//  SceneDelegate.swift
//  GitHubViewer-Storyboard
//
//  Created by Maharjan Binish on 2022/02/05.
//

import UIKit
import Data
import Presentation

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        
        let repositoryResolver = RepositoryResolverImpl()
        let domainResolver = DomainResolverImpl(repositoryResolver: repositoryResolver)
        let presentationResolver = PresentationResolverImpl(domainResolver: domainResolver)
        
        let viewController = presentationResolver.resolveRoot()
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}
}

