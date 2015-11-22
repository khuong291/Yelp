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

class BusinessesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, FiltersViewControllerDelegate {

    @IBOutlet var tableView: UITableView!
    var businesses: [Business]!
    var searchController: UISearchController!
    var refreshControl = UIRefreshControl!()
    //lazy   var searchBar:UISearchBar = UISearchBar(frame: CGRectMake(100, 0, 100, 20))

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 120

        /*searchBar.placeholder = "Search"
        let leftNavBarButton = UIBarButtonItem(customView: searchBar)
        self.navigationItem.leftBarButtonItem = leftNavBarButton*/

        /*Business.searchWithTerm("Thai", completion: { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses

            for business in businesses {
                print(business.name!)
                print(business.address!)
            }
        })*/

        Business.searchWithTerm("Restaurants", sort: .Distance, categories: ["asianfusion", "burgers"], deals: true) { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            self.tableView.reloadData()
        }
    }

    /*func refreshBusiness() {
        self.refreshControl = UIRefreshControl()
        self.refreshControl.attributedTitle = NSAttributedString(string: "🐌🐌🐌🐌Refreshing🐌🐌🐌🐌")
        self.refreshControl.addTarget(self, action: "onRefresh", forControlEvents: .ValueChanged)
        self.tableView.addSubview(refreshControl)
    }

    func onRefresh() {
        self.load()
        self.tableView.reloadData()
        self.refreshControl.endRefreshing()
    }

    func load() {
        let network = Network()

        SVProgressHUD.showWithStatus("Loading data")
        network.load(mediaType) { (mediaList) -> Void in
            if let mediaList = mediaList {
                SVProgressHUD.dismiss()
                self.mediaList = mediaList
                self.tableView.reloadData()
            } else {
                SVProgressHUD.showErrorWithStatus("Error loading data")
            }
        }
    }*/


    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if businesses != nil {
            return businesses!.count
        } else {
            return 0
        }
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BusinessCell", forIndexPath: indexPath) as! BusinessCell
        let business = businesses[indexPath.row]
        cell.displayBusiness(business)
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let navigationController = segue.destinationViewController as!  UINavigationController
        let filtersViewController = navigationController.topViewController as! FiltersViewController
        filtersViewController.delegate = self
    }

    func filtersViewController(filtersViewController: FiltersViewController, didUpdateFilters filters: [String : AnyObject]) {
        let categories = filters["categories"] as? [String]
        Business.searchWithTerm("Restaurants", sort: nil, categories: categories, deals: nil) { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            self.tableView.reloadData()
        }
    }

    /*func updateSearchResultsForSearchController(searchController: UISearchController) {
        let searchText = searchController.searchBar.text

        if searchText == nil {
            return
        }

        let filteredMediaList = mediaList.filter { (media) -> Bool in
            return media.title.containsString(searchText!)
        }

        mediaSearchVC.update(filteredMediaList)
    }*/

    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}