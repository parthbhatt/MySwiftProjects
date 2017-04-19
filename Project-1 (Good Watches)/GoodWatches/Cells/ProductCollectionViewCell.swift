//
//  ProductCollectionViewCell.swift
//  GoodWatches
//
//  Created by Parth Bhatt on 18/04/17.
//  Copyright © 2017 netweb. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgVProduct: UIImageView!
    @IBOutlet weak var lblProductModelNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.white
        self.imgVProduct.layer.shadowColor = themeColor.withAlphaComponent(0.3).cgColor//UIColor.lightGray.cgColor
        self.imgVProduct.layer.shadowOpacity = 1
        self.imgVProduct.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        self.imgVProduct.layer.shadowRadius = 10
        
        
    }
}
