//
//  AppDelegate.swift
//  Scrappy
//
//  Created by Isaac Gonzalez on 5/14/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit
import Firebase
import Stripe

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    

    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let loginVC = LoginViewController()
        let navigationController = UINavigationController(rootViewController: loginVC)
        window?.rootViewController = navigationController
        
        if Auth.auth().currentUser != nil {
            
            ItemController.shared.fetchUserData()
            DispatchQueue.main.async {
                let navController = UINavigationController(rootViewController: SellerPageViewController())
                loginVC.present(navController, animated: true, completion: nil)
            }
        }
        
        self.window?.makeKeyAndVisible()
        
        STPPaymentConfiguration.shared().publishableKey = Constants.publishableKey
        
        return true
    }
}

