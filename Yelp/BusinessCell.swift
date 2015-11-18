//
//  BusinessCell.swift
//  Yelp
//
//  Created by Khuong Pham on 11/18/15.
//  Copyright © 2015 Fantageek. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {
    
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var reviewsCountLabel: UILabel!
    @IBOutlet var categoriesLabel: UILabel!
    @IBOutlet var ratingImageView: UIImageView!
    @IBOutlet var distanceLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var thumbImageView: UIImageView!

    var business: Business! {
        didSet {
            nameLabel.text = business.name
        }
    }
}
