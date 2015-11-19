//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Khuong Pham on 11/18/15.
//  Copyright © 2015 Fantageek. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import BDBOAuth1Manager

class BusinessesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    var businesses: [Business]!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self

        //        Business.searchWithTerm("Thai", completion: { (businesses: [Business]!, error: NSError!) -> Void in
        //            self.businesses = businesses
        //
        //            for business in businesses {
        //                println(business.name!)
        //                println(business.address!)
        //            }
        //        })

        Business.searchWithTerm("Restaurants", sort: .Distance, categories: ["asianfusion", "burgers"], deals: true) { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses

            for business in businesses {
                print(business.name!)
                print(business.address!)
            }
        }
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return businesses.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BusinessCell", forIndexPath: indexPath) as! BusinessCell
        let business = businesses[indexPath.row]
        cell.displayBusiness(business)
        return cell
    }

    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}