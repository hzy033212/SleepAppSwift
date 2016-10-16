//
//  KnowledgeDetailViewController.swift
//  SleepAppSwift
//
//  Created by 陆红 on 10/6/16.
//  Copyright © 2016 陆红. All rights reserved.
//

import UIKit

class KnowledgeDetailViewController: UIViewController {
    
    @IBOutlet var KnowledgeName: UILabel!
    var KnowledgeName2: String = "Knowledges"
    @IBOutlet var webpage: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        KnowledgeName.text = KnowledgeName2;
        let url = NSURL(string: "http://google.com")
        let request = NSURLRequest(URL: url!)
        webpage.loadRequest(request)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
