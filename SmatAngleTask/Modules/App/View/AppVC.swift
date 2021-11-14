//
//  AppVC.swift
//  SmatAngleTask
//
//  Created by Shadi Elattar on 11/14/21.
//

import UIKit
import RxSwift
import RxCocoa

class AppVC: BaseWireFrame<AppViewModel>, UIScrollViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var indexPath = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    
    override func bind(viewModel: AppViewModel) {
        setupTableView()
    }
    
    
    private func setupView(){
        self.navigationItem.title = "Apps"
    }
    
    
    private func setupTableView(){
        tableView.registerNIB(cell: HeaderTableViewCell.self)
        tableView.registerNIB(cell: AppsTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
    }
}


//MARK:- UITabelView setup height
extension AppVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.sections.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell", for: indexPath) as! HeaderTableViewCell
            cell.indexPathRow = indexPath.row
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "AppsTableViewCell", for: indexPath) as! AppsTableViewCell
            cell.title_lbl.text = viewModel.sections.value[indexPath.row].title
            return cell
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 350
        }else{
            return 300
        }
        
    }
}
