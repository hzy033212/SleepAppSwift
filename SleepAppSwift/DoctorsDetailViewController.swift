//
//  SecondViewController.swift
//  SleepAppSwift
//
//  Created by 陆红 on 10/6/16.
//  Copyright © 2016 陆红. All rights reserved.
//

import UIKit

class DoctorsDetailViewController: UIViewController {

    @IBOutlet var DoctorName: UILabel!
    var DoctorName2: String = "Doctors"
    @IBOutlet var webpage: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        DoctorName.text = DoctorName2;
        let url = NSURL(string: "http://google.com")
        let request = NSURLRequest(URL: url!)
        webpage.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

