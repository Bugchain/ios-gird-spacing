//
//  ItemCell.swift
//  GridSpacing
//
//  Created by Chain Chaiyaphat on 23/6/2561 BE.
//  Copyright © 2561 Chain Chaiyaphat. All rights reserved.
//

import UIKit

class ItemCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(text: String){
        titleLabel.text = text
    }
    
    
}
