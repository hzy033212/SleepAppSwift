//
//  FirstViewController.swift
//  SleepAppSwift
//
//  Created by 陆红 on 10/6/16.
//  Copyright © 2016 陆红. All rights reserved.
//

import UIKit

class DoctorsViewController: UITableViewController{
    
    let doctors: [String] = ["Doctor1", "Doctor2", "Doctor3", "Doctor4"]
    let cellReuseIdentifier = "DoctorsCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // number of rows in table view
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.doctors.count
    }
    
    // create a cell for each table view row
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier(cellReuseIdentifier) as UITableViewCell!
        cell.textLabel?.text = self.doctors[indexPath.row]
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if (segue.identifier == "showDoctorDetail") {
                let indexPath = self.tableView.indexPathForSelectedRow!
                let destViewController = segue.destinationViewController as! DoctorsDetailViewController
                destViewController.DoctorName2 = self.doctors[indexPath.row]
            }
    }
    
}

