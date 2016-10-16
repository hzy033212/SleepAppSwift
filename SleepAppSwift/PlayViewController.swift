//
//  PlayViewController.swift
//  SleepAppSwift
//
//  Created by 陆红 on 10/6/16.
//  Copyright © 2016 陆红. All rights reserved.
//

import UIKit
import AVFoundation

class PlayViewController: UIViewController {
    
    var idxPath: NSIndexPath?
    var audioPlayer: AVAudioPlayer!
    var curAudioData: NSData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let currentDefaults = NSUserDefaults.standardUserDefaults()
        let gloRecordArrayTmp = currentDefaults.objectForKey("gloRecordArray")
        gloRecordArray = gloRecordArrayTmp!.mutableCopy() as! NSMutableArray
        curAudioData = gloRecordArray[idxPath!.row] as! NSData
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func PlayTapped(sender: AnyObject) {
        do {
            try audioPlayer = AVAudioPlayer.init(data: curAudioData)
            audioPlayer.play()
        } catch {
        }
    }
}
