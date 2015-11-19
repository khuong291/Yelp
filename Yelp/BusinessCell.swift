//
//  BusinessCell.swift
//  Yelp
//
//  Created by Khuong Pham on 11/18/15.
//  Copyright © 2015 Fantageek. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

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

    func displayBusiness(business: Business) {
        addressLabel.text = business.address
        reviewsCountLabel.text = String(business.reviewCount)
        categoriesLabel.text = business.categories
        ratingImageView.af_setImageWithURL(business.ratingImageURL!)
        distanceLabel.text = business.distance
        nameLabel.text = business.name
        thumbImageView.af_setImageWithURL(business.imageURL!)
    }
}
