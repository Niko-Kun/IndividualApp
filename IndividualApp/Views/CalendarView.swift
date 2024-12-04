//
//  CalendarView.swift
//  IndividualApp
//
//  Created by Nicolò Amabile on 03/12/24.
//

import SwiftUI

struct CalendarView: View {
    let calendar = Calendar.current
    let selectedDate: Date
    
    var body: some View {
        let daysInMonth = DateManager.daysInMonth(date: selectedDate) // Number of days of the current month
        let days = Array(1...daysInMonth) // Array of days
        
        // Calendar Grid
        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 5), spacing: 20) {
            // Grid used to spawn buttons for accessing the day
            ForEach(1..<daysInMonth, id: \.self) { day in
                if day == 0 {
                    ForEach(1..<(calendar.component(.weekday, from: selectedDate)), id: \.self) { _ in
                        Text("")
                            .frame(width: 60, height: 60)
                    }
                }
            }
            
            // Need to change circles to actual buttons or navLinks
            ForEach(days, id: \.self) { day in
                Circle()
                    .stroke(Color.gray, lineWidth: 1)
                    .frame(width: 60, height: 60)
                    .overlay(
                        Text("\(day)")
                            .font(.body)
                            .foregroundColor(.black)
                    )
            }
        }
        .padding()
    }
}
