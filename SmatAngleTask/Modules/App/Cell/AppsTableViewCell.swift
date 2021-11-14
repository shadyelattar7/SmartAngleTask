//
//  AppsTableViewCell.swift
//  SmatAngleTask
//
//  Created by Shadi Elattar on 11/14/21.
//

import UIKit
import RxSwift
import RxCocoa

class AppsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title_lbl: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    var appsInStore: BehaviorRelay<[App]> = .init(value: [
        .init(id: 1, tagline: "Featured", name: "Strokey", subheading: "You'll never stroke the same way again.", image: UIImage(named: "iOS1")!),
        .init(id: 2, tagline: "See it in dark mode", name: "Smartwhirl", subheading: "People who love whirling just like you!", image: UIImage(named: "iOS2")!),
        .init(id: 3, tagline: "New update", name: "Professorify", subheading: "Introducing your portable professor.", image: UIImage(named: "iOS3")!),
        .init(id: 4, tagline: "Featured", name: "SituationMe", subheading: "Your Situation. Dedicated.", image: UIImage(named: "iOS4")!),
        .init(id: 5, tagline: "New update", name: "Squeally", subheading: "Motivate your squealing ecosystem.", image: UIImage(named: "iOS5")!),
        .init(id: 6, tagline: "See it in dark mode", name: "Smartwhirl", subheading: "People who love whirling just like you!", image: UIImage(named: "iOS6")!),
        .init(id: 7, tagline: "New update", name: "Professorify", subheading: "Introducing your portable professor.", image: UIImage(named: "iOS7")!),
        .init(id: 8, tagline: "Featured", name: "SituationMe", subheading: "Your Situation. Dedicated.", image: UIImage(named: "iOS8")!),
        .init(id: 9, tagline: "New update", name: "Squeally", subheading: "Motivate your squealing ecosystem.", image: UIImage(named: "iOS9")!)
    ])
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
    func configure(_ model: Section){
        
    }
    
    func setupCollectionView(){
        collectionView.registerNIB(AppsCollectionViewCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = createCompositionalLayout()
    }
    
    func createFeaturedSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.33))
        
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
        
        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93), heightDimension: .fractionalWidth(0.55))
        let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: layoutGroupSize, subitems: [layoutItem])
        
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.orthogonalScrollingBehavior = .groupPagingCentered
        
        return layoutSection
    }
    
    func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            return self.createFeaturedSection()
        }
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20
        layout.configuration = config
        return layout
    }
    
    
}


//MARK:- UICollection View setup configure
extension AppsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appsInStore.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(cell: AppsCollectionViewCell.self, for: indexPath)
        cell.configure(appsInStore.value[indexPath.row])
        return cell
    }
    
}
