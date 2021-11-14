//
//  BaseViewModel.swift
//  Pizza Station
//
//  Created by Shadi Elattar on 11/7/21.
//

import Foundation
import RxSwift
import RxCocoa

class BaseViewModel: ViewModel{
    var isLoading: PublishSubject<Bool> = .init()
    var displayError: PublishSubject<String> = .init()
}
