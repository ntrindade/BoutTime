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
    @IBAction func move(_ sender: UIButton) {
        do {
            if sender === buttonFullUp {
                try gameModel.roundHistoricalEvents[3].moveUp()
                try gameModel.roundHistoricalEvents[2].moveDown()
            }
            
            if sender === buttonHalfUpTwo {
                try gameModel.roundHistoricalEvents[2].moveUp()
                try gameModel.roundHistoricalEvents[1].moveDown()
            }
            
            if sender === buttonHalfUpOne {
                try gameModel.roundHistoricalEvents[1].moveUp()
                try gameModel.roundHistoricalEvents[0].moveDown()
            }
            
            if sender === buttonFullDown {
                try gameModel.roundHistoricalEvents[0].moveDown()
                try gameModel.roundHistoricalEvents[1].moveUp()
            }
            
            if sender === buttonHalfDownOne {
                try gameModel.roundHistoricalEvents[1].moveDown()
                try gameModel.roundHistoricalEvents[2].moveUp()
            }
            
            if sender === buttonHalfDownTwo {
                try gameModel.roundHistoricalEvents[2].moveDown()
                try gameModel.roundHistoricalEvents[3].moveUp()
            }
            
            gameModel.resetRoundPositions()
            try displayHistoricalEvents()
            
        } catch BoutTimeError.cannotMoveUp {
            showAlert("Alert", message: "Cannot move the event up.")
        } catch let error {
            showAlert("Error", message: "Unexpected error occurred moving the event. \(error.localizedDescription)")
        }
    }
    
    @IBAction func nextRound(_ sender: AnyObject) {
        if gameModel.gameStatus == GameStatus.endOfGame {
            //FIXME: Open new controller with result
        }
        else {
            newRound()
        }
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            // FIXME: Implement the Round Solution in the game
            self.labelInfo.text = "Tap events to learn more"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let urlSegues: [String: String] =
            [
                "segueLabel1": gameModel.roundHistoricalEvents[0].urlString,
                "segueLabel2": gameModel.roundHistoricalEvents[1].urlString,
                "segueLabel3": gameModel.roundHistoricalEvents[2].urlString,
                "segueLabel4": gameModel.roundHistoricalEvents[3].urlString,
            ]
        
        if let webModalViewController = segue.destination as? ViewControllerWebModal {
            webModalViewController.urlString = urlSegues[segue.identifier!]!
            webModalViewController.loadUrl()
        }
    }
    
    // MARK: Helper Methods
    func startNewGame() {
        soundModel.loadGameSounds()
        gameModel.startGame()
        newRound()
        setImagesOnHighlightedButtons()
    }
    
    func newRound() {
        gameModel.gameStatus = gameModel.nextRound()
        buttonResult.isHidden = true
        setTimeoutOnRound()
        do {
            try displayHistoricalEvents()
        }
        catch BoutTimeError.undefinedPosition {
            showAlert("Error", message: "Error displaying historical events")
        }
        catch let error {
            showAlert("Error", message: "Unexpected error occurred starting new round. \(error.localizedDescription)")
        }
    }
    
    func displayHistoricalEvents() throws {
        for historicalEvent in gameModel.roundHistoricalEvents {
            switch historicalEvent.currentPosition {
            case 0:
                labelEvent1.text = historicalEvent.text
                break
            case 1:
                labelEvent2.text = historicalEvent.text
                break
            case 2:
                labelEvent3.text = historicalEvent.text
                break
            case 3:
                labelEvent4.text = historicalEvent.text
                break
            default:
                throw BoutTimeError.undefinedPosition
            }
        }
    }
    
    func setImagesOnHighlightedButtons() {
        buttonFullDown.setImage(#imageLiteral(resourceName: "DownFullSelected"), for: UIControlState.highlighted)
        buttonHalfUpOne.setImage(#imageLiteral(resourceName: "UpHalfSelected"), for: UIControlState.highlighted)
        buttonHalfDownOne.setImage(#imageLiteral(resourceName: "DownHalfSelected"), for: UIControlState.highlighted)
        buttonHalfUpTwo.setImage(#imageLiteral(resourceName: "UpHalfSelected"), for: UIControlState.highlighted)
        buttonHalfDownTwo.setImage(#imageLiteral(resourceName: "DownHalfSelected"), for: UIControlState.highlighted)
        buttonFullUp.setImage(#imageLiteral(resourceName: "UpFullSelected"), for: UIControlState.highlighted)
    }
    
    func showAlert(_ title: String, message: String? = nil, style: UIAlertControllerStyle = .alert) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
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
            // FIXME: Implement the Round Solution in the game
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(seconds), execute: gameWorkItem!)
    }
    
    func suspendTimeout() {
        gameWorkItem?.cancel()
    }
}

