//
//  HeaderTableViewCell.swift
//  SmatAngleTask
//
//  Created by Shadi Elattar on 11/14/21.
//

import UIKit
import RxSwift
import RxCocoa

class HeaderTableViewCell: UITableViewCell, UIScrollViewDelegate {
    
    @IBOutlet weak var headerCollectionView: UICollectionView!
    
    let disposeBag = DisposeBag()
    var indexPathRow: Int = 0
    
    
    var apps: BehaviorRelay<[App]> = .init(value: [
        .init(id: 1, tagline: "Featured", name: "Strokey", subheading: "You'll never stroke the same way again.", image: UIImage(named: "Heading1")!),
        .init(id: 2, tagline: "See it in dark mode", name: "Smartwhirl", subheading: "People who love whirling just like you!", image: UIImage(named: "Heading2")!),
        .init(id: 3, tagline: "New update", name: "Professorify", subheading: "Introducing your portable professor.", image: UIImage(named: "Heading3")!),
        .init(id: 4, tagline: "Featured", name: "SituationMe", subheading: "Your Situation. Dedicated.", image: UIImage(named: "Heading4")!),
        .init(id: 5, tagline: "New update", name: "Squeally", subheading: "Motivate your squealing ecosystem.", image: UIImage(named: "Heading5")!)
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
        headerCollectionView.registerNIB(HeaderCollectionViewCell.self)
        headerCollectionView.delegate = self
        headerCollectionView.dataSource = self
        headerCollectionView.collectionViewLayout = createCompositionalLayout()
        
    }
    
    
    func createFeaturedSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
        
        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93), heightDimension: .estimated(350))
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroupSize, subitems: [layoutItem])
        
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


//MARK:- UICOllection view configuration
extension HeaderTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return apps.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(cell: HeaderCollectionViewCell.self, for: indexPath)
        cell.configure(apps.value[indexPath.row])
        return cell
    }
    
    
}
