//
//  Date+DateToSring.swift
//  Pomac
//
//  Created by Ahmed Ezzat on 01/11/2021.
//

import Foundation

extension String {
    func getDateFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        let date = dateFormatter.date(from: self)!
        // convert date back to string
        dateFormatter.dateFormat = "EEEE, dd-MMM-yyyy h:mm a"
        dateFormatter.calendar = Calendar.init(identifier: .gregorian)
        //UTC time zone
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        //English locale
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        let dateString = dateFormatter.string(from: date)
        
        return dateString
    }
}
