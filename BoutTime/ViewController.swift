//
//  ViewController.swift
//  BoutTime
//
//  Created by Nuno Trindade on 03/09/16.
//  Copyright © 2016 Remarkable Code Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var gameModel = GameModel()
    var soundModel = SoundModel()
    
    var timeoutBlocker: dispatch_block_t?
    var timeoutDisplay: Int = 0
    var timer: NSTimer?
    
    @IBOutlet weak var labelEvent1: UILabel!
    @IBOutlet weak var labelEvent2: UILabel!
    @IBOutlet weak var labelEvent3: UILabel!
    @IBOutlet weak var labelEvent4: UILabel!

    @IBOutlet weak var buttonFullDown: UIButton!
    @IBOutlet weak var buttonHalfUpOne: UIButton!
    @IBOutlet weak var buttonHalfDownOne: UIButton!
    @IBOutlet weak var buttonHalfUpTwo: UIButton!
    @IBOutlet weak var buttonHalfDownTwo: UIButton!
    @IBOutlet weak var buttonFullUp: UIButton!
    
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var labelInfo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        soundModel.loadGameSounds()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Action Methods
    
    @IBAction func MoveUp(sender: UIButton) {
    
    }
    
    @IBAction func MoveDown(sender: UIButton) {
    
    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake {
            // FIXME: Implement the Round Solution in the game
            self.labelInfo.text = "Shaken, not stirred"
        }
    }
    
    // MARK: Helper Methods
    
    func showAlert(title: String, message: String? = nil, style: UIAlertControllerStyle = .Alert) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        
        let okAction = UIAlertAction(title: "OK", style: .Default, handler: dismissAlert)
        
        alertController.addAction(okAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func dismissAlert(sender: UIAlertAction) {
        // TODO: Implement method
    }
    
    func setTimeoutOnQuestion() {
        timeoutDisplay = gameModel.roundTimeoutInSeconds
        let timerUpdateInSeconds = 1.0
        timer = NSTimer.scheduledTimerWithTimeInterval(timerUpdateInSeconds, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
        
        timeoutRound(seconds: gameModel.roundTimeoutInSeconds)
    }
    
    func updateTimer() {
        if timeoutDisplay >= 0 {
            labelTime.text = DateTimeConverter.secondsToHoursMinutesSeconds(timeoutDisplay)
            timeoutDisplay -= 1
        }
    }
    
    func timeoutRound(seconds seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, delay)
        
        // Executes the nextRound method at the dispatch time on the main queue
        dispatch_after(dispatchTime, dispatch_get_main_queue(), timeoutBlocker!)
    }
}

