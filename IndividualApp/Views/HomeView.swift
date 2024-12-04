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
//    @State private var isPickerPresented = false
    
    var body: some View {
        ScrollView {
            VStack {
                // Visualize the month on top of the screen
                HStack {
                    Text(DateManager.formatter_mm_yy(date: selectedDate))
                        .font(.system(size: 18))
                        .multilineTextAlignment(.center)
                        .bold()
                        .textCase(.uppercase)
//                        .onTapGesture {
//                            isPickerPresented.toggle()
//                        }
                }
                .padding(.horizontal)
                
                CalendarView(selectedDate: selectedDate)
            }
//            .sheet(isPresented: $isPickerPresented) {
//                // Contenuto della sheet: Picker per mese e anno
//                VStack {
//                    DatePicker(
//                        "",
//                        selection: $selectedDate,
//                        displayedComponents: [.date]
//                    )
//                    .datePickerStyle(.wheel) // Usa stile grafico
//                    .labelsHidden() // Nasconde le etichette
//                    .environment(\.locale, Locale(identifier: "en_EN")) // Lingua italiana
//                    
//                    Button("Chiudi") {
//                        isPickerPresented = false // Chiudi la sheet
//                    }
//                    .padding()
//                }
//                .presentationDetents([.medium, .fraction(0.7)])
//            }
        }
    }
}

#Preview {
    HomeView()
}
