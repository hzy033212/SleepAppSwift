//
//  KnowledgeViewController.swift
//  SleepAppSwift
//
//  Created by 陆红 on 10/6/16.
//  Copyright © 2016 陆红. All rights reserved.
//

import UIKit

class KnowledgeViewController: UITableViewController{
    
    let knowledges: [String] = ["Knowledge1", "Knowledge2", "Knowledge3", "Knowledge4"]
    let cellReuseIdentifier = "KnowledgesCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // number of rows in table view
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.knowledges.count
    }
    
    // create a cell for each table view row
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier(cellReuseIdentifier) as UITableViewCell!
        cell.textLabel?.text = self.knowledges[indexPath.row]
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showKnowledgeDetail") {
            let indexPath = self.tableView.indexPathForSelectedRow!
            let destViewController = segue.destinationViewController as! KnowledgeDetailViewController
            destViewController.KnowledgeName2 = self.knowledges[indexPath.row]
        }
    }
    
}
