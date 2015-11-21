//
//  SwitchCell.swift
//  Yelp
//
//  Created by Khuong Pham on 11/20/15.
//  Copyright © 2015 Fantageek. All rights reserved.
//

import UIKit

@objc protocol SwitchCellDelegate {
    optional func switchCell(switchCell: SwitchCell, didChangeValue value: Bool)
}

class SwitchCell: UITableViewCell {

    @IBOutlet var onSwitch: UISwitch!
    @IBOutlet var switchLabel: UILabel!

    weak var delegate: SwitchCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        onSwitch.addTarget(self, action: "switchValueChanged", forControlEvents: UIControlEvents.ValueChanged)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func switchValueChanged() {
        if delegate != nil {
            delegate?.switchCell?(self, didChangeValue: onSwitch.on)
        }
    }
}
