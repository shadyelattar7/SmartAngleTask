//
//  Navigator.swift
//  Pizza Station
//
//  Created by Shadi Elattar on 10/12/21.
//

import Foundation
import UIKit

enum navigatorTypes {
    case push
    case present
    case root
    case presentNavgation
}


protocol Navigator {
    associatedtype Destination
    func viewController(for destination: Destination) -> UIViewController
    init(coordentor: Coordinator)
    var coordentor: Coordinator {get}
    func navigate(to destination: Destination, with navigatorType: navigatorTypes)
}


extension Navigator{
    func navigate(to destination: Destination, with navigatorType: navigatorTypes = .push){
        let viewController = self.viewController(for: destination)
        switch navigatorType{
        case .push:
            coordentor.navgationController?.pushViewController(viewController, animated: true)
        case .present:
            coordentor.navgationController?.present(viewController, animated: true, completion: nil)
        case .root:
            coordentor.navgationController?.setViewControllers([viewController], animated: true)
        case .presentNavgation:
            let nav = UINavigationController(rootViewController: viewController)
            coordentor.navgationController?.present(nav, animated: true, completion: nil)
        }
        
        
        
    }
}
