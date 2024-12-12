//
//  ToolbarView.swift
//  IndividualApp
//
//  Created by Nicolò Amabile on 03/12/24.
//

import SwiftUI

struct ToolbarView: View {
    
    let data: [Day]
    
    var body: some View {
        VStack {
            TabView(selection: .constant(0)) {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                ChartView(data: data)
                    .tabItem {
                        Image(systemName: "chart.dots.scatter")
                        Text("Chart")
                    }
            }
            .accentColor(.purple)
        }
    }
}

#Preview {
    let sampleDays = [
            Day(date: Date(), emotion: .happy, whatDay: "12", whatMonth: "December", whatYear: "2024", notes: "Great day", dayImage: nil),
            Day(date: Date().addingTimeInterval(-86400), emotion: .sad, whatDay: "11", whatMonth: "December", whatYear: "2024", notes: "Bad day", dayImage: nil),
            Day(date: Date().addingTimeInterval(-2 * 86400), emotion: .love, whatDay: "10", whatMonth: "December", whatYear: "2024", notes: "Lovely day", dayImage: nil)
        ]
    
    ToolbarView(data: sampleDays)
}
