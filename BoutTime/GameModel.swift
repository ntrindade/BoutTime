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
    let roundTimeoutInSeconds = 5
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
        
        roundHistoricalEvents = historicalEventModel.getHistoricalEvents(numberOfHistoricalEventsPerRound, historicalEvents: gameHistoricalEvents)
        sortedHistoricalEvents = historicalEventModel.sortHistoricalEventsByYearMonth(roundHistoricalEvents)
        gameHistoricalEvents.removeObjectsInArray(roundHistoricalEvents)
        
        if gameHistoricalEvents.count == 0 {
            return GameStatus.endOfGame
        }
        return GameStatus.nextQuestion
    }

    func resetRoundPositions() {
        roundHistoricalEvents = historicalEventModel.sortHistoricalEventsByCurrentPosition(roundHistoricalEvents)
    }
    
    func isRoundCorrect() -> Bool {
        
        for roundHistoricalEvent in roundHistoricalEvents {
            if roundHistoricalEvent.currentPosition != roundHistoricalEvent.correctPosition {
                return false
            }
        }
        correctRounds += 1
        return true
    }
}
