//
//  DateManager.swift
//  IndividualApp
//
//  Created by Nicolò Amabile on 04/12/24.
//

import Foundation

class DateManager {
    // Funzione per ottenere il numero di giorni in un mese
    static func daysInMonth(date: Date) -> Int {
        let calendar = Calendar.current
        let currentDate = Date()
        let range = calendar.range(of: .day, in: .month, for: date)
        // Default a 30 giorni se non si riesce a calcolare
        return range?.count ?? 30
    }
    
    static func formatter_mm_yy(date : Date) -> String {
        let formatterDate = DateFormatter()
        
        formatterDate.dateFormat = "yyyy\nMMMM"
        formatterDate.locale = Locale(identifier: "en_EN")
        
        let dateString = formatterDate.string(from: date)
        return dateString
    }
}

