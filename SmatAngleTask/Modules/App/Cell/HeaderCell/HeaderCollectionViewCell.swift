//
//  HeaderCollectionViewCell.swift
//  SmatAngleTask
//
//  Created by Shadi Elattar on 11/14/21.
//

import UIKit

class HeaderCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var tagline_lbl: UILabel!
    @IBOutlet weak var name_lbl: UILabel!
    @IBOutlet weak var subtitle_lbl: UILabel!
    @IBOutlet weak var imageView_iv: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    
    func configure(_ model: App){
        tagline_lbl.text = model.tagline
        name_lbl.text = model.name
        subtitle_lbl.text = model.subheading
        imageView_iv.image = model.image
    }
    
}
