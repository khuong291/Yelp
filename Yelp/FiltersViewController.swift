//
//  FiltersViewController.swift
//  Yelp
//
//  Created by Khuong Pham on 11/20/15.
//  Copyright © 2015 Fantageek. All rights reserved.
//

import UIKit

@objc protocol FiltersViewControllerDelegate {
    optional func filtersViewController(filtersViewController: FiltersViewController, didUpdateFilters filters: [String : AnyObject])
}

class FiltersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, SwitchCellDelegate {

    @IBOutlet var tableView: UITableView!
    weak var delegate: FiltersViewControllerDelegate?

    var categories: [[String:String]]!
    var switchStates = [Int:Bool]()

    override func viewDidLoad() {
        super.viewDidLoad()
        categories = yelpCategories()
        tableView.dataSource = self
        tableView.delegate = self
    }

    @IBAction func onSearchButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        var filters = [String : AnyObject]()
        delegate?.filtersViewController?(self, didUpdateFilters: filters)
        var selectedCategories = [String]()
        for (row, isSelected) in switchStates {
            if isSelected {
                selectedCategories.append(categories[row]["code"]!)
            }
        }
        if selectedCategories.count > 0 {
            filters["categories"] = selectedCategories
        }
    }

    @IBAction func onCancelButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SwitchCell", forIndexPath: indexPath) as! SwitchCell
        cell.switchLabel.text = categories[indexPath.row]["name"]
        cell.delegate = self
        cell.onSwitch.on = switchStates[indexPath.row] ?? false
        return cell
    }

    func switchCell(switchCell: SwitchCell, didChangeValue value: Bool) {
        let indexPath = tableView.indexPathForCell(switchCell)!
        switchStates[indexPath.row] = value

    }

    func yelpCategories() -> [[String:String]] {
        return [["name" : "Afghan", "code" : "afghani"],
        ["name" : "African", "code" : "africa"],
        ["name" : "American, New", "code" : "newamerican"],
        ["name" : "American, Traditional", "code" : "tradamerican"],
        ["name" : "Arabian", "code" : "arabian"],
        ["name" : "Argentine", "code" : "argentine"],
        ["name" : "Armenian", "code" : "armenian"],
        ["name" : "Asian Fusion", "code" : "asian fusion"],
        ["name" : "Asturian", "code" : "asturian"],
        ["name" : "Australian", "code" : "australian"]]
    }
}
