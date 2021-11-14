//
//  AppDelegate.swift
//  SmatAngleTask
//
//  Created by Shadi Elattar on 11/14/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var coordinator: AppCoordinator!
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        coordinator = AppCoordinator()
        coordinator.start()
        
        
        return true
    }




}

