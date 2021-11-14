//
//  TabBarController.swift
//  BaZZar
//
//  Created by Shadi Elattar on 11/4/21.
//

import UIKit

class TabBarController: UITabBarController {
    
    var coordinator: Coordinator
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    enum TabBarItem: Int, CaseIterable{
        case app
        case games
        case arcade
        case search
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarItem()
        
    }
    
    
    private func setupTabBarItem(){
        self.viewControllers = TabBarItem.allCases.map({
                                                        let view = viewControllerForTabBarItem($0)
                                                        let navigation = UINavigationController(rootViewController: view)
                                                        return navigation})
    }
    
    func viewControllerForTabBarItem(_ item: TabBarItem) -> UIViewController{
        switch item{
        case .app:
            let view = coordinator.Main.viewController(for: .app)
            view.tabBarItem = tabBarItem(for: item)
            return view
        case .games:
            let view = coordinator.Main.viewController(for: .games)
            view.tabBarItem = tabBarItem(for: item)
            return view
        case .arcade:
            let view = coordinator.Main.viewController(for: .arcade)
            view.tabBarItem = tabBarItem(for: item)
            return view
        case .search:
            let view = coordinator.Main.viewController(for: .search)
            view.tabBarItem = tabBarItem(for: item)
            return view
        }
    }
    
    private func tabBarItem(for item: TabBarItem) -> UITabBarItem?{
        let tabBarItem: UITabBarItem
        switch item{
        case .app:
            tabBarItem = .init(title: "Apps", image: UIImage(systemName: "square.stack.3d.up.fill"), selectedImage: UIImage(systemName: "square.stack.3d.up.fill"))
        case .games:
            tabBarItem = .init(title: "Games", image: UIImage(systemName: "gamecontroller"), selectedImage: UIImage(systemName: "gamecontroller"))
        case .arcade:
            tabBarItem = .init(title: "Arcade", image: UIImage(systemName: "dollarsign.circle"), selectedImage: UIImage(systemName: "dollarsign.circle"))
        case .search:
            tabBarItem = .init(title: "Search", image: UIImage(systemName: "magnifyingglass"), selectedImage:UIImage(systemName: "magnifyingglass"))
        }
        tabBarItem.titlePositionAdjustment = .init(horizontal: 0, vertical: 10)
        tabBarItem.imageInsets = .init(top: 10, left: 0, bottom: -10, right: 0  )
        return tabBarItem
    }
    
}
