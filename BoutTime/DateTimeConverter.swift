//
//  DateTimeConverter.swift
//  BoutTime
//
//  Created by Nuno Trindade on 12/09/16.
//  Copyright © 2016 Remarkable Code Ltd. All rights reserved.
//

class DateTimeConverter {
    func secondsToHoursMinutesSeconds (_ seconds : Int) -> (Int, Int, Int) {
        let hours = seconds / 3600
        let minutes = (seconds % 3600) / 60
        let seconds = (seconds % 3600) % 60
        return (hours, minutes, seconds)
    }
    
    func secondsToHoursMinutesSeconds(_ seconds: Int) -> String {
        let (hours, minutes, seconds) = secondsToHoursMinutesSeconds(seconds)
        let hoursString = hours > 0 ? "\(String(format: "%02d", hours)):" : ""

        return "\(hoursString)\(String(format: "%02d", minutes)):\(String(format: "%02d", seconds))"
    }
}
