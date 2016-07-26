//
//  SearchFilterViewController.swift
//  Yelp
//
//  Created by Martene Mendy on 7/23/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit
//import Cocoa

class SearchFilterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, SwitchViewCellDelegate {


   @IBOutlet weak var filterTableView: UITableView!
   @IBOutlet weak var cancelBarButtonItem: UIBarButtonItem!
   @IBOutlet weak var searchBarButtonItem: UIBarButtonItem!

   var currentPreferences = [Int:[Bool]]()

   let filterPreferences = FilterPreferences()

   let searchData = [["", ["Offering a deal"]],
                     ["Distance",["Auto","0.3 miles"]],
                     ["Sort By", ["Best Match","Distance"]],
                     ["Category", ["Afghan", "African", "America (New)", "America (Traditional)", "Asian"]]]


   let CellIdentifier = "TableViewCell", headerViewIdentifier = "TableViewHeaderView", cellSwitchIdentifier = "SwitchCell"

   override func viewDidLoad() {
      super.viewDidLoad()

      // Do any additional setup after loading the view.

      filterTableView.delegate = self
      filterTableView.dataSource = self

      //filterTableView.registerClass(SwitchViewCell.self, forCellReuseIdentifier: cellSwitchIdentifier)
      //filterTableView.registerClass(SelectViewCell.self, forCellReuseIdentifier: "SelectCell")
      //filterTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: CellIdentifier)
      filterTableView.registerClass(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: headerViewIdentifier)


      cancelBarButtonItem.setTitleTextAttributes([ NSFontAttributeName: UIFont(name: "Arial", size: 13)!], forState: UIControlState.Normal)
      searchBarButtonItem.setTitleTextAttributes([ NSFontAttributeName: UIFont(name: "Arial", size: 13)!], forState: UIControlState.Normal)

      // initialize checked
      for (k, v) in searchData.enumerate() {
         print("key: \(k) --value: \(v[1].count)")
         currentPreferences[k] = [Bool](count: v[1].count, repeatedValue: false)
      }

      filterTableView.reloadData()
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }

   @IBAction func onCancel(sender: UIBarButtonItem) {
      dismissViewControllerAnimated(true, completion: nil)
   }

   @IBAction func onSearch(sender: UIBarButtonItem) {
       dismissViewControllerAnimated(true, completion: nil)
   }


   
   /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */


   func numberOfSectionsInTableView(tableView: UITableView) -> Int {
      return searchData.count
   }

   func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return searchData[section][1].count
   }


   func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

      let sectionData = searchData[indexPath.section]
      let rowData = sectionData[1]

      print("loading section[\(indexPath.section)] row[\(indexPath.row)] label[\(rowData[indexPath.row])]")

      if  indexPath.section == 0  || indexPath.section == 3  {

         let cell = tableView.dequeueReusableCellWithIdentifier(cellSwitchIdentifier, forIndexPath: indexPath) as! SwitchViewCell
         cell.switchNameLabel.text = rowData[indexPath.row] as? String

         cell.tableSection = indexPath.section
         cell.tableRow = indexPath.row
         cell.delegate = self

         cell.layer.cornerRadius = 3 //set corner radius here
         cell.layer.borderColor = UIColor.lightGrayColor().CGColor  // set cell border color here
         cell.layer.borderWidth = 0.5

         return cell
      }
      else {

         let cell = tableView.dequeueReusableCellWithIdentifier("SelectCell", forIndexPath: indexPath) as! SelectViewCell
         cell.selectNameLabel.text = rowData[indexPath.row] as? String

         cell.tableSection = indexPath.section
         cell.tableRow = indexPath.row

         cell.layer.cornerRadius = 3 //set corner radius here
         cell.layer.borderColor = UIColor.lightGrayColor().CGColor  // set cell border color here
         cell.layer.borderWidth = 0.5

         if currentPreferences[indexPath.section]![indexPath.row] == true {
            cell.accessoryType = .Checkmark
         } else {
            cell.accessoryType = .None
         }

         return cell
      }
   }

   func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
      let header = tableView.dequeueReusableHeaderFooterViewWithIdentifier(headerViewIdentifier)! as UITableViewHeaderFooterView
      header.textLabel!.text = searchData[section][0] as? String
      //      header.textLabel?.textAlignment = NSTextAlignment.Left

      header.contentView.backgroundColor = UIColor.whiteColor()
      return header
   }

   func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
      if section == 0 {
         return 0.0
      }
      else {
         return 35.0
      }
   }

   func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
      tableView.deselectRowAtIndexPath(indexPath, animated: true)

      let selectedSection = indexPath.section
      let selectedRow = indexPath.row

      if  selectedSection != 0 && selectedSection != 3 { // only for SelectCell type
         currentPreferences[selectedSection]![selectedRow] = !currentPreferences[selectedSection]![selectedRow]
         print ("checked row \(currentPreferences[selectedSection]![selectedRow]) ")
      }
      tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
   }
/*
   func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
      let selectedSection = indexPath.section
      let selectedRow = indexPath.row

      if  selectedSection != 0 && selectedSection != 3 {
         if currentPreferences[selectedSection]![selectedRow] == true {
         return 45.0
      }
      else {
         return 0.0
      }
      }
      return 45.0
   }
*/

   func cellDidToggle(cell: SwitchViewCell, newValue: Bool) {
      print("storing toggle section[\(cell.tableSection)] row[\(cell.tableRow)] value[\(newValue)]")
      currentPreferences[cell.tableSection]![cell.tableRow] = newValue
   }

   
}
