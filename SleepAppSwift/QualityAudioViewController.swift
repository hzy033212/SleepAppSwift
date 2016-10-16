//
//  QualityAudioViewController.swift
//  SleepAppSwift
//
//  Created by 陆红 on 10/6/16.
//  Copyright © 2016 陆红. All rights reserved.
//

import UIKit

class QualityAudioViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var ShowQuality: UILabel!
    var levels = ["High", "Medium", "Low"]
    var quality = ""
    
    // UIPickerViewDataSource
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int)->Int {
        return levels.count
    }
    
    // UIPickerViewDelegate
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return levels[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.ShowQuality.text = levels[row]
        let currentDefaults = NSUserDefaults.standardUserDefaults()
        quality = self.ShowQuality.text!
        currentDefaults.setObject(quality, forKey: "quality")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let currentDefaults = NSUserDefaults.standardUserDefaults()
        self.ShowQuality.text = currentDefaults.stringForKey("quality")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
