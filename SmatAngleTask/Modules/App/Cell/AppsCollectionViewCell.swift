//
//  AppsCollectionViewCell.swift
//  SmatAngleTask
//
//  Created by Shadi Elattar on 11/14/21.
//

import UIKit

class AppsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var Firsticon_iv: UIImageView!
    @IBOutlet weak var secondIcon_iv: UIImageView!
    @IBOutlet weak var thiredIcon_iv: UIImageView!
    
    @IBOutlet weak var firstName_lbl: UILabel!
    @IBOutlet weak var secondName_lbl: UILabel!
    @IBOutlet weak var thiredName_lbl: UILabel!
    
    @IBOutlet weak var firstDescripation_lbl: UILabel!
    @IBOutlet weak var secondDescripation_lbl: UILabel!
    @IBOutlet weak var thirdDescripation_lbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(_ model: App){
        Firsticon_iv.image = model.image
        secondIcon_iv.image = model.image
        thiredIcon_iv.image = model.image
        
        firstName_lbl.text = model.name
        secondName_lbl.text = model.name
        thiredName_lbl.text = model.name
        
        firstDescripation_lbl.text = model.subheading
        secondDescripation_lbl.text = model.subheading
        thirdDescripation_lbl.text = model.subheading
        
    }
    
}
