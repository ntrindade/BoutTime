//
//  DateTimeConverter.swift
//  BoutTime
//
//  Created by Nuno Trindade on 12/09/16.
//  Copyright © 2016 Remarkable Code Ltd. All rights reserved.
//

class DateTimeConverter {
    class func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    class func secondsToHoursMinutesSeconds(seconds: Int) -> String {
        let (hours, minutes, seconds) = DateTimeConverter.secondsToHoursMinutesSeconds(seconds)
        let hoursString = hours > 0 ? "\(String(format: "%02d", hours)):" : ""

        return "\(hoursString)\(String(format: "%02d", minutes)):\(String(format: "%02d", seconds))"
    }
}