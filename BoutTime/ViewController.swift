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
    var timer: Timer? = nil
    var dateTimeConverter: DateTimeConverter = DateTimeConverter()
    
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
        soundModel.loadGameSounds()
        startNewGame()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: Action Methods
    @IBAction func move(_ sender: UIButton) {
        
        do {
            
            if timeoutDisplay == -1 {
                return
            }
            
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
        } catch BoutTimeError.cannotMoveDown {
            showAlert("Alert", message: "Cannot move the event down.")
        } catch let error {
            showAlert("Error", message: "Unexpected error occurred moving the event. \(error.localizedDescription)")
        }
    }
    
    
    @IBAction func unwindToNewGame(segue: UIStoryboardSegue) {
        
        startNewGame()
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        if motion == .motionShake && buttonResult.isHidden == true {
            suspendTimeout()
            checkRoundResult()
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if identifier.contains("segueLabel") {
            return timeoutDisplay == -1
        }
        
        if identifier == "segueFinalScore" {
            if gameModel.gameStatus == GameStatus.endOfGame {
                return true
            }
            else {
                newRound()
                return false
            }
        }
        
        return true
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
        
        if let gameResultViewController = segue.destination as? ViewControllerGameResult {
            gameResultViewController.score = "\(gameModel.correctRounds)/\(gameModel.numberOfRoundsPerGame)"
        }
    }
    
    // MARK: Helper Methods
    
    func startNewGame() {
        
        gameModel.startGame()
        newRound()
        setImagesOnHighlightedButtons()
    }
    
    func newRound() {
        
        labelTime.isHidden = false
        buttonResult.isHidden = true
        gameModel.gameStatus = gameModel.nextRound()
        labelInfo.text = "Shake to complete"
        
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
    
    func checkRoundResult() {
        
        labelInfo.text = "Tap events to learn more"
        timeoutDisplay = -1
        timer?.invalidate()
        labelTime.isHidden = true
        buttonResult.isHidden = false
        gameWorkItem = nil
        
        if gameModel.isRoundCorrect() {
            buttonResult.setImage(#imageLiteral(resourceName: "NextRoundSuccess"), for: UIControlState.normal)
            soundModel.playCorrectSound()
        } else {
            buttonResult.setImage(#imageLiteral(resourceName: "NextRoundFail"), for: UIControlState.normal)
            soundModel.playIncorrectSound()
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
        
        timeoutRound(seconds: gameModel.roundTimeoutInSeconds)
        timeoutDisplay = gameModel.roundTimeoutInSeconds
        labelTime.text = dateTimeConverter.secondsToHoursMinutesSeconds(timeoutDisplay)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateTimer), userInfo: labelTime.text, repeats: true)
    }
    
    func updateTimer() {
        
        timeoutDisplay -= 1
        if timeoutDisplay > -1 {
            labelTime.text = dateTimeConverter.secondsToHoursMinutesSeconds(timeoutDisplay)
        }
    }
    
    func timeoutRound(seconds: Int) {
        
        gameWorkItem = DispatchWorkItem(qos: .default, flags: .enforceQoS) {
            print("Timeout: \(self.timeoutDisplay)")
            self.checkRoundResult()
        }
        print("Seconds to timeout: \(seconds)")
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(seconds), execute: gameWorkItem!)
    }
    
    func suspendTimeout() {
        
        gameWorkItem?.cancel()
    }
}

