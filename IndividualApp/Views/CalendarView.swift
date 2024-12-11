//
//  CalendarView.swift
//  IndividualApp
//
//  Created by Nicolò Amabile on 03/12/24.
//

import SwiftUI
import Foundation

struct CalendarView: View {
    let calendar = Calendar.current
    @State var selectedDate: Date
    
    @State private var isPickerPresented = false
    
    var body: some View {
        let daysInMonth = DateManager.daysInMonth(date: selectedDate) // Number of days of the current month
        let days = Array(1...daysInMonth) // Array of days
        
        VStack {
            // Visualize the month on top of the screen
            Text(DateManager.formatter_mm_yy(date: selectedDate))
                .font(.system(size: 18))
                .multilineTextAlignment(.center)
                .bold()
                .textCase(.uppercase)
                .onTapGesture {
                    isPickerPresented.toggle()
                }
            
            NavigationStack {
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
                    
                    ForEach(days, id: \.self) { day in
                        // Concatenate the date of the created day
                        let selectedDayDate = DateManager.createDate(day: day, from: selectedDate)
                        
                        NavigationLink(destination: DayDetailsView(selectedDate: selectedDayDate)) {
                            Circle()
                                .stroke(Color.gray, lineWidth: 2)
                                .frame(width: 60, height: 60)
                                .overlay(
                                    Text("\(day)")
                                        .font(.body)
                                        .foregroundColor(.black)
                                )
                                .accessibilityLabel("Day \(day)")
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
            }
            .sheet(isPresented: $isPickerPresented) {
                // Sheet: picker for month and year
                VStack {
                    DatePicker(
                        "",
                        selection: $selectedDate,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(.wheel)
                    .labelsHidden()
                    .environment(\.locale, Locale(identifier: "en_EN"))
                    
                    Button("Chiudi") {
                        isPickerPresented = false
                    }
                    .padding()
                }
                .presentationDetents([.medium, .fraction(0.5)])
            }
        }
    }
}

#Preview {
    CalendarView(selectedDate: .now)
}
