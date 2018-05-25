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


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let rootNav = RootNavigationViewController() 

        rootNav.viewControllers = [LoginViewController()] // Home

        
        
        window?.rootViewController = rootNav
        window?.makeKeyAndVisible()
        
        FirebaseApp.configure()
        ItemController.shared.fetchAllSellingItems()
        
        STPPaymentConfiguration.shared().publishableKey = Constants.publishableKey
        
        return true
    }
}

