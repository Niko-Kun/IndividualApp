//
//  ChartView.swift
//  IndividualApp
//
//  Created by Nicolò Amabile on 11/12/24.
//

import SwiftUI
import Charts

struct ChartView: View {
    let data: [Day]
    
    var body: some View {
        Chart(data) { day in
            LineMark(
                x: .value("Date", day.date, unit: .day),
                y: .value("Emotion", day.emotion.numericValue)
            )
        }
        .chartYAxisLabel("Emotion Level")
        .chartXAxisLabel("Date")
        .frame(width: 370, height: 300)
    }
}

#Preview {
    let sampleDays = [
            Day(date: Date(), emotion: .happy, whatDay: "12", whatMonth: "December", whatYear: "2024", notes: "Great day", dayImage: nil),
            Day(date: Date().addingTimeInterval(-86400), emotion: .sad, whatDay: "11", whatMonth: "December", whatYear: "2024", notes: "Bad day", dayImage: nil),
            Day(date: Date().addingTimeInterval(-2 * 86400), emotion: .love, whatDay: "10", whatMonth: "December", whatYear: "2024", notes: "Lovely day", dayImage: nil),
            Day(date: Date().addingTimeInterval(-3 * 86400), emotion: .normal, whatDay: "13", whatMonth: "December", whatYear: "2024", notes: "Lovely day", dayImage: nil),
            Day(date: Date().addingTimeInterval(-4 * 86400), emotion: .sad, whatDay: "15", whatMonth: "December", whatYear: "2024", notes: "Lovely day", dayImage: nil)
        ]
    
    ChartView(data: sampleDays)
}
