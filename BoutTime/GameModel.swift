//
//  GameModel.swift
//  BoutTime
//
//  Created by Nuno Trindade on 08/09/16.
//  Copyright © 2016 Remarkable Code Ltd. All rights reserved.
//

import Foundation

class GameModel {

    let numberOfRoundsPerGame = 6
    let numberOfHistoricalEventsPerRound = 4
    let roundTimeoutInSeconds = 60
    let historicalEventModel = HistoricalEventModel()
    
    var gameStatus: GameStatus = GameStatus.nextQuestion
    var gameHistoricalEvents: [HistoricalEvent] = []
    var roundHistoricalEvents: [HistoricalEvent] = []
    var sortedHistoricalEvents: [HistoricalEvent] = []
    
    var correctRounds = 0

    func startGame() {

        correctRounds = 0
        let totalNumberOfHistoricalEvents = numberOfRoundsPerGame * numberOfHistoricalEventsPerRound
        gameHistoricalEvents = historicalEventModel.getHistoricalEvents(totalNumberOfHistoricalEvents)
    }
    
    func nextRound() -> GameStatus {
        if gameHistoricalEvents.count == 0 {
            return GameStatus.endOfGame
        }
        
        roundHistoricalEvents = historicalEventModel.getHistoricalEvents(numberOfHistoricalEventsPerRound, historicalEvents: gameHistoricalEvents)
        sortedHistoricalEvents = historicalEventModel.sortHistoricalEvents(roundHistoricalEvents)
        gameHistoricalEvents.removeObjectsInArray(roundHistoricalEvents)
        
        return GameStatus.nextQuestion
    }

    func resetRoundPositions() {
        roundHistoricalEvents = historicalEventModel.resetHistoricalEvents(roundHistoricalEvents)
    }
    
    func roundResultIsCorrect() -> Bool {
        for roundHistoricalEvent in roundHistoricalEvents {
            if roundHistoricalEvent.currentPosition != roundHistoricalEvent.correctPosition {
                return false
            }
        }
        return true
    }
}
