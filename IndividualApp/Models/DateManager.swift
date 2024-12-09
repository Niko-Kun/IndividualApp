//
//  DateManager.swift
//  IndividualApp
//
//  Created by Nicolò Amabile on 04/12/24.
//

import Foundation

class DateManager {
    // How many days in this month
    static func daysInMonth(date: Date) -> Int {
        let calendar = Calendar.current
        let currentDate = Date()
        let range = calendar.range(of: .day, in: .month, for: date)
        // Default 30 days
        return range?.count ?? 30
    }
    
    static func formatter_mm_yy(date : Date) -> String {
        let formatterDate = DateFormatter()
        
        formatterDate.dateFormat = "yyyy\nMMMM"
        formatterDate.locale = Locale(identifier: "en_EN")
        
        let dateString = formatterDate.string(from: date)
        return dateString
    }
    
    static func formatter_dd_mm_yy(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy"
        return formatter.string(from: date)
    }
    
    static func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
}

