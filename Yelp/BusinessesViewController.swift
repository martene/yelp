//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,  UISearchBarDelegate {

   var businesses: [Business]!
   var searchBar: UISearchBar!

   @IBOutlet weak var businessTableView: UITableView!
   @IBOutlet weak var filterBarButtonItem: UIBarButtonItem!

   var filterPreferences: FilterPreferences!

   override func viewDidLoad() {
      super.viewDidLoad()

      businessTableView.delegate = self
      businessTableView.dataSource = self

      // for autloayout
      businessTableView.rowHeight = UITableViewAutomaticDimension
      businessTableView.estimatedRowHeight = 120

      searchBar = UISearchBar()
      let inputTextField = searchBar.valueForKey("searchField") as! UITextField
      inputTextField.font = UIFont(name: "Arial", size: 13)!
      searchBar.placeholder = "Restaurants"
      searchBar.delegate = self
      searchBar.sizeToFit()
      navigationItem.titleView = searchBar

      filterBarButtonItem.setTitleTextAttributes([ NSFontAttributeName: UIFont(name: "Arial", size: 13)!], forState: UIControlState.Normal)

      let sText = searchBar.text
      filterPreferences = filterPreferences ?? FilterPreferences()

      print("prefs deal: \(filterPreferences.deals) search: \(sText)")

      /*
       Business.searchWithTerm("", completion: { (businesses: [Business]!, error: NSError!) -> Void in
       self.businesses = businesses

       self.businessTableView.reloadData()
       //         for business in businesses {
       //            print(business.name!)
       //            print(business.address!)
       //         }

       }) */
      /* Example of Yelp search with more search options specified
       Business.searchWithTerm("Restaurants", sort: filterPreferences.sortBy, categories: filterPreferences.categories, deals: filterPreferences.deals) { (businesses: [Business]!, error: NSError!) -> Void in
       self.businesses = businesses

       self.businessTableView.reloadData()
       // for business in businesses {
       // print(business.name!)
       ///print(business.address!)
       // }
       }
       */
      performSearch(searchBar.text!)
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }


   // MARK: - Navigation

   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
      // Get the new view controller using segue.destinationViewController.
      // Pass the selected object to the new view controller.

      print("segue \(segue.identifier) sender")
     // let navController = segue.destinationViewController as! UINavigationController
     // let navControlPrefs = navController.topViewController as! SearchFilterViewController
      //navControlPrefs.currentPreferences = self.filterPreferences
   }



   func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      let businessCell = tableView.dequeueReusableCellWithIdentifier("BusinessCell", forIndexPath: indexPath) as! BusinessViewCell
      let currentRowIndex = indexPath.row
      let business = self.businesses[currentRowIndex]
      //print("row \(currentRowIndex) : \(business.name)")
      businessCell.cellRow = indexPath.row
      businessCell.businessData = business
      // no color when user select cell
      businessCell.selectionStyle = .None

      return businessCell
   }

   func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return self.businesses?.count ?? 0
   }


   func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {

      performSearch(searchText)
   }

   func performSearch(searchText: String){

      Business.searchWithTerm(searchText, sort: filterPreferences.sortBy, categories: filterPreferences.categories, deals: filterPreferences.deals) { (businesses: [Business]!, error: NSError!) -> Void in
         self.businesses = businesses
         
         self.businessTableView.reloadData()
      }
      
   }
   
}
