//
//  RecordListViewController.swift
//  SleepAppSwift
//
//  Created by 陆红 on 10/6/16.
//  Copyright © 2016 陆红. All rights reserved.
//

import UIKit

class RecordListViewController: UITableViewController{
    
    let cellReuseIdentifier = "RecordCell"
    
    override func viewWillAppear(animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // number of rows in table view
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (gloTimeArray.count != gloRecordArray.count) {
            print("Error two array length not same!")
        }
        return gloTimeArray.count
    }
    
    // create a cell for each table view row
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier(cellReuseIdentifier) as UITableViewCell!
        cell.textLabel?.text = gloTimeArray![indexPath.row] as? String
        return cell
    }
    
    // delete a cell for each table view row
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            gloTimeArray.removeObjectAtIndex(indexPath.row)
            gloRecordArray.removeObjectAtIndex(indexPath.row)
            let currentDefaults = NSUserDefaults.standardUserDefaults()
            currentDefaults.setObject(gloRecordArray, forKey: "gloRecordArray")
            currentDefaults.setObject(gloTimeArray, forKey: "gloTimeArray")
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "playRecordDetail") {
            let indexPath = self.tableView.indexPathForSelectedRow!
            let destViewController = segue.destinationViewController as! PlayViewController
            destViewController.idxPath = indexPath
        }
    }
    
}
