//
//  Event.swift
//  BoutTime
//
//  Created by Nuno Trindade on 05/09/16.
//  Copyright © 2016 Remarkable Code Ltd. All rights reserved.
//

import Foundation

class HistoricalEvent: HistoricalEventType, Moveable {
    let text: String
    let year: Int
    let month: Month
    let url: NSURL
    
    let lowestPosition = 0
    let highestPosition = 3
    
    var currentPosition: Int = -1
    var correctPosition: Int = -1
    
    let movement = 1
    
    required init(text: String, year: Int, month: Month, url: NSURL) {
        self.text = text
        self.year = year
        self.url = url
        self.month = month
    }
    
    func moveUp() throws {
        
        if currentPosition < highestPosition {
            currentPosition += movement
        }
        
        throw BoutTimeError.CannotMoveUp("Cannot move Up")
    }
    
    func moveDown() throws {
        
        if currentPosition > lowestPosition {
            currentPosition -= movement
        }
        
        throw BoutTimeError.CannotMoveDown("Cannot move Down")
    }
}
