//
//  ProductTableViewCell.swift
//  ShoppingAssistant
//
//  Created by Gaman Rares-Constantin on 1/7/20.
//  Copyright © 2020 Gaman Rares-Constantin. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productName: UILabel!
    
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var nrOfOffers: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
