//
//  AppViewModel.swift
//  SmatAngleTask
//
//  Created by Shadi Elattar on 11/14/21.
//

import Foundation
import RxSwift
import RxCocoa

class AppViewModel: BaseViewModel{
 
    var sections: BehaviorRelay<[Section]> = .init(value: [
        .init(id: 1, type: "", title: "", subtitle: ""),
        .init(id: 1, type: "", title: "Popular Apps to Try", subtitle: ""),
        .init(id: 1, type: "", title: "Photo Filter and Present", subtitle: ""),
        .init(id: 1, type: "", title: "Top Free Apps", subtitle: "")
    ])
    
    
    
}
