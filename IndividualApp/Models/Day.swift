//
//  Day.swift
//  IndividualApp
//
//  Created by Nicolò Amabile on 05/12/24.
//

import SwiftUI
import SwiftData
import Foundation

@Model
class Day: Identifiable {
    
    var id : UUID = UUID()
    var date: Date
    var emotion : Emotion
    var whatDay : String = "Today"
    var whatMonth : String = "December"
    var whatYear : String = "2024"
    var notes : String? = ""
    var dayImage : Data?
    
    init(date: Date, emotion: Emotion, whatDay: String, whatMonth: String, whatYear: String, notes: String? = "", dayImage: Data?) {
        self.id = UUID()
        self.date = date
        self.emotion = emotion
        self.whatDay = whatDay
        self.whatMonth = whatMonth
        self.whatYear = whatYear
        self.notes = notes
        self.dayImage = dayImage
    }
}

enum Emotion: String, CaseIterable, Codable {
    case sad = "☹️"
    case meh = "😐"
    case normal = "🙂"
    case happy = "😁"
    case love = "🥰"
    
    var numericValue: Int {
            switch self {
            case .sad:
                return 1
            case .meh:
                return 2
            case .normal:
                return 3
            case .happy:
                return 4
            case .love:
                return 5
            }
        }
}
