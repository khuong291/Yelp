//
//  DropDownCell.swift
//  Yelp
//
//  Created by Khuong Pham on 11/22/15.
//  Copyright © 2015 Fantageek. All rights reserved.
//

import UIKit

@objc protocol DropDownCellDelegate {
    optional func selectCell(dropDownCell: DropDownCell, didSelect currentImg: UIImage)
}

class DropDownCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!

    @IBOutlet weak var iconView: UIImageView!

    var delegate: DropDownCellDelegate!
    
}