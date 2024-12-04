//
//  HomeView.swift
//  IndividualApp
//
//  Created by Nicolò Amabile on 04/12/24.
//

import SwiftUI

struct HomeView: View {
    let calendar = Calendar.current
    @State private var selectedDate = Date()
    @State private var isPickerPresented = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    // Visualize the month on top of the screen
                    HStack {
                        Text(DateManager.formatter_mm_yy(date: selectedDate))
                            .font(.system(size: 18))
                            .multilineTextAlignment(.center)
                            .bold()
                            .textCase(.uppercase)
                            .onTapGesture {
                                isPickerPresented.toggle()
                            }
                    }
                    .padding(.horizontal)
                    
                    CalendarView(selectedDate: selectedDate)
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
                    .presentationDetents([.medium, .fraction(0.7)])
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
