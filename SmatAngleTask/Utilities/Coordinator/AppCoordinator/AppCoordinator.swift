//
//  AppCoordinator.swift
//  Pizza Station
//
//  Created by Shadi Elattar on 10/12/21.
//

import Foundation
import UIKit

protocol Coordinator {
    var Main: MainNavigator {get}
    var navgationController: UINavigationController? {get}
}

class AppCoordinator: Coordinator{
 

    let window: UIWindow
    
    var isLogin: Bool = false
    
    private lazy var tabBar: TabBarController = {
        return TabBarController(coordinator: self)
    }()
    
    
    lazy var Main: MainNavigator = {
        return .init(coordentor: self)
    }()
    

    
    var navgationController: UINavigationController? {
            if let navgationController = tabBar.selectedViewController as? UINavigationController{
                return navgationController
            }
        
        return nil
    }
    
    init(window: UIWindow = UIWindow()) {
        self.window = window
        
    }
    
    func start (){
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    //MARK:- To make logic here ->
    var rootViewController: UIViewController{
        return tabBar
    }
}
