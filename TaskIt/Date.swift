//
//  Date.swift
//  TaskIt
//
//  Created by Rosie  on 10/24/15.
//  Copyright © 2015 Rosie . All rights reserved.
//

import Foundation

class Date{

    class func from (year: Int, month: Int, day: Int) -> NSDate {
        
        var componenets = NSDateComponents()
        componenets.year = year
        componenets.month = month
        componenets.day = day
        
        var gregorianCalendar = NSCalendar(identifier: NSGregorianCalendar)
        var date = gregorianCalendar?.dateFromComponents(componenets)
        
        return date!
    }
    
    class func toString (date:NSDate) -> String {
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateStringFormatter.stringFromDate(date)
        return dateString
    }
}