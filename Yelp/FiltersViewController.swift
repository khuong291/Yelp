//
//  FiltersViewController.swift
//  Yelp
//
//  Created by Khuong Pham on 11/20/15.
//  Copyright © 2015 Fantageek. All rights reserved.
//

import UIKit

class FiltersViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBAction func onSearchButton(sender: AnyObject) {

    }
    @IBAction func onCancelButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
