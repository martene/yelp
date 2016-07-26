//
//  FilterTableViewController.swift
//  Yelp
//
//  Created by Martene Mendy on 7/25/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

class FilterTableViewController: UIViewController, UITableViewDataSource {

   @IBOutlet var filtersTableView: UITableView!
   @IBOutlet weak var cancelButtonItem: UIBarButtonItem!
   @IBOutlet weak var searchButtonItem: UIBarButtonItem!
   
  /* var checked = [Int:[Bool]]()

   let searchData = [["", ["Offering a deal"]],
                     ["Distance",["Auto","0.3 miles","1 mile","5 miles","20 miles"]],
                     ["Sort By", ["Best Match","Distance","High Rated"]],
                     ["Category", ["America", "African", "Asian"]]]

  let CellIdentifier = "TableViewCell", HeaderViewIdentifier = "TableViewHeaderView"
   
*/
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()

      filtersTableView.dataSource = self
      cancelButtonItem.setTitleTextAttributes([ NSFontAttributeName: UIFont(name: "Arial", size: 13)!], forState: UIControlState.Normal)
      searchButtonItem.setTitleTextAttributes([ NSFontAttributeName: UIFont(name: "Arial", size: 13)!], forState: UIControlState.Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
      return 1 //searchData.count
    }

   func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows

      print("section \(section)")
        return 3 //searchData[section][1].count
    }


    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      print("row \(indexPath)")

      let sectionId = indexPath.section
      print("row \(sectionId)")
      if ( sectionId == 0){
         let cell = tableView.dequeueReusableCellWithIdentifier("SwitchCell", forIndexPath: indexPath)  as? SwitchViewCell
         return cell!
      }
      else {
         let cell = tableView.dequeueReusableCellWithIdentifier("SelectCell", forIndexPath: indexPath)  as? SelectViewCell
         return cell!
      }
   }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
