//
//  Day.swift
//  IndividualApp
//
//  Created by Nicolò Amabile on 05/12/24.
//

import SwiftUI

class Day: Identifiable {
    
    var id : UUID = UUID()
    var emotion : String = Emotion.normal.rawValue
    var whatDay : String = "Today"
    var whatMonth : String = "December"
    var whatYear : String = "2024"
    var notes : String = ""
    
    init(emotion: String, whatDay: String, whatMonth: String, whatYear: String, notes: String) {
        self.emotion = emotion
        self.whatDay = whatDay
        self.whatMonth = whatMonth
        self.whatYear = whatYear
        self.notes = notes
    }
}

enum Emotion: String, CaseIterable {
    case sad = "☹️"
    case meh = "😐"
    case normal = "🙂"
    case happy = "😁"
    case love = "🥰"
}
