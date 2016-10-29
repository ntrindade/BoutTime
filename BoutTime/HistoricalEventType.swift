//
//  HistoricalEventType.swift
//  BoutTime
//
//  Created by Nuno Trindade on 05/09/16.
//  Copyright © 2016 Remarkable Code Ltd. All rights reserved.
//

import Foundation

protocol HistoricalEventType {
    var text: String { get }
    var year: Int { get }
    var month: Month { get }
    var urlString: String { get }
    
    var lowestPosition: Int { get }
    var highestPosition: Int { get }
    
    var currentPosition: Int { get set }
    var correctPosition: Int { get set }
    
    init(text: String, year: Int, month: Month, urlString: String)
}
