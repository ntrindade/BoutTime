//
//  Event.swift
//  BoutTime
//
//  Created by Nuno Trindade on 05/09/16.
//  Copyright © 2016 Remarkable Code Ltd. All rights reserved.
//  Equatable implementation credits to: https://gist.github.com/hooman/cfe98f9ac55c93f15247

import Foundation

class HistoricalEvent: HistoricalEventType, Moveable, Equatable {
    let text: String
    let year: Int
    let month: Month
    let urlString: String
    
    let lowestPosition = 0
    let highestPosition = 3
    
    var currentPosition: Int = -1
    var correctPosition: Int = -1
    
    let movement = 1
    
    required init(text: String, year: Int, month: Month, urlString: String) {
        
        self.text = text
        self.year = year
        self.urlString = urlString
        self.month = month
    }
    
    func moveUp() throws {
        
        if currentPosition > lowestPosition {
            currentPosition -= movement
        }
        else {
            throw BoutTimeError.cannotMoveUp
        }
    }
    
    func moveDown() throws {
        
        if currentPosition < highestPosition {
            currentPosition += movement
            return
        }
        else {
            throw BoutTimeError.cannotMoveDown
        }
    }
    
    func equals<T>(_ other: T) -> Bool where T: HistoricalEvent {
        
        return text == other.text && year == other.year && month == other.month
    }
}

func ==<T>(lhs: T, rhs: T) -> Bool where T: HistoricalEvent {
    
    return lhs.equals(rhs)
}






