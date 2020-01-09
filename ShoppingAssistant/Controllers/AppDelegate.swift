//
//  AppDelegate.swift
//  ShoppingAssistant
//
//  Created by Gaman Rares-Constantin on 10/2/19.
//  Copyright © 2019 Gaman Rares-Constantin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        initDatabase()
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let loginController: LoginController = mainStoryboard.instantiateViewController(withIdentifier: "LoginView") as! LoginController
        let userInfoController: UserInfoController = mainStoryboard.instantiateViewController(withIdentifier: "UserInfoView") as! UserInfoController
        let productListNavigationController: ProductListNavigationController = mainStoryboard.instantiateViewController(withIdentifier: "ProductListNavigationView") as! ProductListNavigationController
        loginController.modalPresentationStyle = .fullScreen
        userInfoController.modalPresentationStyle = .fullScreen
        productListNavigationController.modalPresentationStyle = .fullScreen
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [productListNavigationController, userInfoController]
        
        if UserDefaults.standard.isLoggedIn() {
            self.window?.rootViewController = tabBarController
        } else {
            self.window?.rootViewController = loginController
        }
        
        self.window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    private func initDatabase() {
        HighPerformanceButCostlyDatabase.users.insert(User(fullName: "test", password: "9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08", email: "test@yahoo.com", role: Role.ADMINISTRATOR))
        let macBookPro = Product(name: "MacBook Pro 16'", image: #imageLiteral(resourceName: "macbookPro16'"), description: "test")
        HighPerformanceButCostlyDatabase.products.insert(macBookPro)
        HighPerformanceButCostlyDatabase.products.insert(Product(name: "iPad Pro 12.9'", image: #imageLiteral(resourceName: "iPadPro"), description: "test"))
        HighPerformanceButCostlyDatabase.products.insert(Product(name: "iPhone 11 Pro Max", image: #imageLiteral(resourceName: "iPhone11ProMax"), description: "test"))
        let offer = Offer(user:  HighPerformanceButCostlyDatabase.users.first!, price: 2799.00)
        HighPerformanceButCostlyDatabase.offers.insert(offer)
        macBookPro.addOffer(offer: offer)
    }


}

