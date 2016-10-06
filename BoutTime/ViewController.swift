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
    
    var gameWorkItem: DispatchWorkItem? = nil
    var timeoutDisplay: Int = 0
    var timer: Timer?
    
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
    @IBOutlet weak var buttonResult: UIButton!
    
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var labelInfo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: Action Methods
    
    @IBAction func MoveUp(_ sender: UIButton) {
        
    }
    
    @IBAction func MoveDown(_ sender: UIButton) {
    
    }
    
    @IBAction func NextRound(_ sender: AnyObject) {
    
    }
    
    
    override var canBecomeFirstResponder : Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            // FIXME: Implement the Round Solution in the game
            self.labelInfo.text = "Shaken, not stirred"
        }
    }
    
    // MARK: Helper Methods
    func startNewGame() {
        soundModel.loadGameSounds()
        gameModel.startGame()
        newRound()
    }
    
    func newRound() {
        displayHistoricalEvents()
        setTimeoutOnRound()
    }
    
    func displayHistoricalEvents() {
        labelEvent1.text = gameModel.roundHistoricalEvents[0].text
        labelEvent2.text = gameModel.roundHistoricalEvents[1].text
        labelEvent3.text = gameModel.roundHistoricalEvents[2].text
        labelEvent4.text = gameModel.roundHistoricalEvents[3].text
    }
    
    func showAlert(_ title: String, message: String? = nil, style: UIAlertControllerStyle = .alert) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: dismissAlert)
        
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func dismissAlert(_ sender: UIAlertAction) {
        // TODO: Implement method
    }
    
    func setTimeoutOnRound() {
        timeoutDisplay = gameModel.roundTimeoutInSeconds
        let timerUpdateInSeconds = 1.0
        timer = Timer.scheduledTimer(timeInterval: timerUpdateInSeconds, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
        
        timeoutRound(seconds: gameModel.roundTimeoutInSeconds)
    }
    
    func updateTimer() {
        if timeoutDisplay >= 0 {
            labelTime.text = DateTimeConverter.secondsToHoursMinutesSeconds(timeoutDisplay)
            timeoutDisplay -= 1
        }
    }
    
    func timeoutRound(seconds: Int) {
        gameWorkItem = DispatchWorkItem(qos: .default, flags: .enforceQoS) {
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(seconds), execute: gameWorkItem!)
    }
    
    func suspendTimeout() {
        gameWorkItem?.cancel()
    }
}

