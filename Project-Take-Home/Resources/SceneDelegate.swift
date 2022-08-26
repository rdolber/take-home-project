//
//  SceneDelegate.swift
//  Project-Take-Home
//
//  Created by Ray Dolber on 8/24/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        UITabBar.appearance().standardAppearance        = appearance
        UITabBar.appearance().scrollEdgeAppearance      = appearance
        UITabBar.appearance().tintColor                 = .systemGreen
        
        guard let windowScene   = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = createTabBar()
        window?.makeKeyAndVisible()
        
        configureNavigationBar()
    }
    
    func configureNavigationBar() {
        UINavigationBar.appearance().tintColor = .systemGreen
    }
    
    func createSearchNC() -> UINavigationController {
        let searchVC            = SearchVC()
        searchVC.title          = "Search"
        searchVC.tabBarItem     = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        return UINavigationController(rootViewController: searchVC)
    }
    
    func createFavoritesNC() -> UINavigationController {
        let favoritesVC         = FavoritesListVC()
        favoritesVC.title       = "Favorites"
        favoritesVC.tabBarItem  = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        return UINavigationController(rootViewController: favoritesVC)
    }
    
    func createTabBar() -> UITabBarController {
        let tabBar              = UITabBarController()
        tabBar.viewControllers  = [createSearchNC(), createFavoritesNC()]
        
        return tabBar
    }

    func sceneDidDisconnect(_ scene: UIScene) { }

    func sceneDidBecomeActive(_ scene: UIScene) { }

    func sceneWillResignActive(_ scene: UIScene) { }

    func sceneWillEnterForeground(_ scene: UIScene) { }

    func sceneDidEnterBackground(_ scene: UIScene) { }
}
