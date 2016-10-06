//
//  RandomNumber.swift
//  BoutTime
//
//  Created by Nuno Trindade on 03/09/16.
//  Copyright © 2016 Remarkable Code Ltd. All rights reserved.
//

import GameplayKit          

class RandomNumber {
    
    class func getWithUpperBoundAndRestrictions(upperBound: Int, restrictions: [Int]) -> Int {
        
        let lowerBoundLimit = -1
        var randomNumber: Int = -1
        
        repeat {
            let tempNumber: Int = GKRandomSource.sharedRandom().nextInt(upperBound: upperBound)
            if restrictions.contains(tempNumber) {
                continue
            }
            randomNumber = tempNumber
            
        } while randomNumber == lowerBoundLimit
            
        return randomNumber
    }
}
