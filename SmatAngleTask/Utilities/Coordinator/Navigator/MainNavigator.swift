//
//  MainNavigator.swift
//  Pizza Station
//
//  Created by Shadi Elattar on 10/12/21.
//

import Foundation
import UIKit

class MainNavigator: Navigator{
    var coordentor: Coordinator
    
    enum Destination{
        case app
        case games
        case arcade
        case search
        
    }
    
    required init(coordentor: Coordinator) {
        self.coordentor = coordentor
    }
    
    func viewController(for destination: Destination) -> UIViewController {
        switch destination{
        case .app:
            let viewModel = AppViewModel()
            let view = AppVC(viewModel: viewModel, coordinator: coordentor)
            return view
        case .games:
            let viewModel = GamesViewModel()
            let view = GamesVC(viewModel: viewModel, coordinator: coordentor)
            return view
        case .arcade:
            let viewModel = ArcadeViewModel()
            let view = ArcadeVC(viewModel: viewModel, coordinator: coordentor)
            return view
        case .search:
            let viewModel = SearchViewModel()
            let view = SearchVC(viewModel: viewModel, coordinator: coordentor)
            return view
        }
    }
}
