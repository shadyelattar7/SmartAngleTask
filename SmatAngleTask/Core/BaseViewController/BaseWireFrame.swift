//
//  BaseWireFrame.swift
//  Pizza Station
//
//  Created by Shadi Elattar on 10/12/21.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift
import RxReachability
import Reachability
import SVProgressHUD

protocol ViewModel {
    
}

class BaseWireFrame<T: BaseViewModel>: UIViewController{
    let viewModel: T
    var coordinator: Coordinator
    
    lazy var disposeBag = {
        return  DisposeBag()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        bind(viewModel: viewModel)
        bindStatus()
    }
    
    
    init(viewModel: T,coordinator:  Coordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    
    
    func bind(viewModel: T){
        fatalError("Please override bind function")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func bindStatus(){
        viewModel.displayError.subscribe { [weak self] (text) in
            ToastManager.shared.showToast(message: text, view: self?.view ?? UIView(), postion: .top, backgroundColor: .systemRed)
        }.disposed(by: disposeBag)
        
        
        viewModel.isLoading.subscribe { (isLoading) in
            guard let isloading = isLoading.element else {return}
            if isloading{
                SVProgressHUD.show()
            }else{
                SVProgressHUD.dismiss()
            }
        }.disposed(by: disposeBag)
        
        
        //MARK:- reachability state binding
        
        Reachability.rx.isReachable.subscribe(onNext: { isReachable in
            if isReachable == false {
                ToastManager.shared.showToast(message: "No Network foun...", view: self.view ?? UIView(), postion: .top, backgroundColor: .systemRed)
            }
        }).disposed(by: disposeBag)
    }
    
    
}
