//
//  FoodTableViewCell.swift
//  iFood
//
//  Created by iosdev on 1.5.2017.
//  Copyright © 2017 Tien. All rights reserved.
//

import UIKit

class FoodTableViewCell: UITableViewCell {
    @IBOutlet weak var lblFoodName: UILabel!

    @IBOutlet weak var lblFoodPrice: UILabel!
    @IBOutlet weak var imgFood: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
