//
//  RecordViewController.swift
//  SleepAppSwift
//
//  Created by 陆红 on 10/6/16.
//  Copyright © 2016 陆红. All rights reserved.
//

import UIKit
import AVFoundation

class RecordViewController: UIViewController {
    
    var recorder: AVAudioRecorder!
    @IBOutlet var recordStopButton: UIButton!
    
    
    override func viewWillAppear(animated: Bool) {
        
        let audioSession = AVAudioSession.sharedInstance()
        var recordSettings = [AVSampleRateKey : NSNumber(float: Float(44100.0)),
                              AVFormatIDKey : NSNumber(int: Int32(kAudioFormatMPEG4AAC)),
                              AVNumberOfChannelsKey : NSNumber(int: 1)]
        
        let currentDefaults = NSUserDefaults.standardUserDefaults()
        let quality =  currentDefaults.stringForKey("quality")
        if quality == "Low" {
            recordSettings[AVEncoderAudioQualityKey] = NSNumber(int: Int32(AVAudioQuality.Low.rawValue))
        } else if quality == "Medium" {
            recordSettings[AVEncoderAudioQualityKey] = NSNumber(int: Int32(AVAudioQuality.Medium.rawValue))
        } else if quality == "High" {
            recordSettings[AVEncoderAudioQualityKey] = NSNumber(int: Int32(AVAudioQuality.High.rawValue))
        }
        // For test only!
        // print(quality)
        
        do {
            try audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try recorder = AVAudioRecorder(URL: self.directoryURL("MyAudioMemo.m4a")!,
                                            settings: recordSettings)
            recorder.prepareToRecord()
        } catch {
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func RecordStopTapped(sender: AnyObject) {
        
        if (recordStopButton.titleLabel!.text == "Record") {
            // Start recording
            recorder.record()
            recordStopButton.setTitle("Stop", forState: UIControlState.Normal)
        } else {
            // Stop recording
            self.myStop(recorder, withIdx: -1) // withIdx parameter has NO meaning!
            recordStopButton.setTitle("Record", forState: UIControlState.Normal)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func directoryURL(fileName: String) -> NSURL? {
        let fileManager = NSFileManager.defaultManager()
        let urls = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let documentDirectory = urls[0] as NSURL
        let soundURL = documentDirectory.URLByAppendingPathComponent(fileName)
        return soundURL
    }
    
    func myStop(recorder: AVAudioRecorder, withIdx: Int) {
        recorder.stop()
        
        let audioData = NSData(contentsOfURL: recorder.url)
        gloRecordArray.insertObject(audioData!, atIndex: 0)
        
        let curDate = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale.currentLocale()
        dateFormatter.dateStyle = NSDateFormatterStyle.FullStyle
        let convertedDate = dateFormatter.stringFromDate(curDate) as String
        gloTimeArray.insertObject(convertedDate, atIndex: 0)
        
        let currentDefaults = NSUserDefaults.standardUserDefaults()
        
        // Save gloRecordArray and gloTimeArray
        currentDefaults.setObject(gloTimeArray, forKey: "gloTimeArray")
        currentDefaults.setObject(gloRecordArray, forKey: "gloRecordArray")

        
    }
    
    
}

