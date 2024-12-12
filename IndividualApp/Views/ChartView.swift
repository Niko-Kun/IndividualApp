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
        ScrollView {
            VStack {
                Spacer()
                
                if data.isEmpty {
                    Spacer()
                    Text("There is no data. Try adding some new day!")
                    Spacer()
            } else {
                    VStack {
                        Text("Line Chart")
                        
                        Chart(data) { day in
                            LineMark(
                                x: .value("Date", day.date, unit: .day),
                                y: .value("Emotion", day.emotion.numericValue)
                            )
                        }
                        .chartYAxisLabel("Emotion Level")
                        .chartXAxisLabel("Date")
                        .frame(width: 350, height: 250)
                        .foregroundStyle(.purple)
                    }
                    .frame(width: 370, height: 350)
                    
                    VStack {
                        Text("Bar Chart")
                        
                        Chart(data) { day in
                            BarMark(
                                x: .value("Date", day.date, unit: .day),
                                y: .value("Emotion", day.emotion.numericValue)
                            )
                            .foregroundStyle(by: .value("Emotion", day.emotion.rawValue))
                        }
                        .chartYAxisLabel("Emotion Level")
                        .chartXAxisLabel("Date")
                        .frame(width: 350, height: 250)
                    }
                    .frame(width: 370, height: 350)
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    let sampleDays = [
            Day(date: Date(), emotion: .happy, whatDay: "11", whatMonth: "December", whatYear: "2024", notes: "Great day", dayImage: nil),
            Day(date: Date().addingTimeInterval(86400), emotion: .love, whatDay: "12", whatMonth: "December", whatYear: "2024", notes: "Bad day", dayImage: nil),
            Day(date: Date().addingTimeInterval(2*86400), emotion: .meh, whatDay: "13", whatMonth: "December", whatYear: "2024", notes: "Bad day", dayImage: nil),
            Day(date: Date().addingTimeInterval(3*86400), emotion: .sad, whatDay: "14", whatMonth: "December", whatYear: "2024", notes: "Bad day", dayImage: nil),
            Day(date: Date().addingTimeInterval(4*86400), emotion: .normal, whatDay: "15", whatMonth: "December", whatYear: "2024", notes: "Bad day", dayImage: nil),
            Day(date: Date().addingTimeInterval(5*86400), emotion: .meh, whatDay: "13", whatMonth: "December", whatYear: "2024", notes: "Bad day", dayImage: nil),
            Day(date: Date().addingTimeInterval(6*86400), emotion: .sad, whatDay: "14", whatMonth: "December", whatYear: "2024", notes: "Bad day", dayImage: nil),
            Day(date: Date().addingTimeInterval(7*86400), emotion: .normal, whatDay: "15", whatMonth: "December", whatYear: "2024", notes: "Bad day", dayImage: nil),
            Day(date: Date().addingTimeInterval(8*86400), emotion: .sad, whatDay: "14", whatMonth: "December", whatYear: "2024", notes: "Bad day", dayImage: nil),
            Day(date: Date().addingTimeInterval(9*86400), emotion: .normal, whatDay: "15", whatMonth: "December", whatYear: "2024", notes: "Bad day", dayImage: nil),
            Day(date: Date().addingTimeInterval(10*86400), emotion: .meh, whatDay: "13", whatMonth: "December", whatYear: "2024", notes: "Bad day", dayImage: nil),
            Day(date: Date().addingTimeInterval(11*86400), emotion: .sad, whatDay: "14", whatMonth: "December", whatYear: "2024", notes: "Bad day", dayImage: nil),
            Day(date: Date().addingTimeInterval(12*86400), emotion: .normal, whatDay: "15", whatMonth: "December", whatYear: "2024", notes: "Bad day", dayImage: nil),
            
        ]
    
    ChartView(data: sampleDays)
}
