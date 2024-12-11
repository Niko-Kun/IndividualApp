//
//  DayDetailsView.swift
//  IndividualApp
//
//  Created by Nicolò Amabile on 04/12/24.
//

import SwiftUI
import SwiftData
import Foundation

struct DayDetailsView: View {
    
    @Environment(\.modelContext) private var context
    @Query private var days: [Day]
    
    let selectedDate: Date
    
    @State private var selectedMood: Emotion = .normal
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    
                    Spacer()
                    Toolbar()
                    
                    Text(DateManager.formatter_dd_mm_yy(selectedDate))
                        .bold()
                        .frame(width: 170, height: 40)
                        .padding(5)
                        .multilineTextAlignment(.center)
                    
                    ZStack {
                        Rectangle()
                            .cornerRadius(20)
                            .frame(width: 370, height: 100)
                            .foregroundStyle(Color(.systemGray6))
                        
                        Picker("Mood of today", selection: $selectedMood) {
                            ForEach(Emotion.allCases, id: \.self) { emotion in
                                Text(emotion.rawValue.capitalized)
                            }
                        }
                        .pickerStyle(.segmented)
                        .disabled(true)
                        .frame(width: 350, height: 100)
                        .onAppear {
                            // Default Emotion
                            if let dayForSelectedDate = days.first(where: { day in
                                Calendar.current.isDate(day.date, inSameDayAs: selectedDate)
                            }) {
                                selectedMood = dayForSelectedDate.emotion
                            }
                        }
                    }
                    .onChange(of: selectedMood) { newValue in
                        if let index = days.firstIndex(where: { day in
                            Calendar.current.isDate(day.date, inSameDayAs: selectedDate)
                        }) {
                            days[index].emotion = newValue
                            // Persisti il cambiamento nel database se necessario
                            do {
                                try context.save()
                            } catch {
                                print("Errore durante il salvataggio: \(error.localizedDescription)")
                            }
                        }
                    }
                }
                
                ZStack {
                    Rectangle()
                        .cornerRadius(20)
                        .frame(width: 370, height: 250)
                        .foregroundStyle(Color(.systemGray6))
                    
                    Text(days.first(where: { day in
                        Calendar.current.isDate(day.date, inSameDayAs: selectedDate)
                    })?.notes ?? "No notes today")
                        .bold()
                        .multilineTextAlignment(.center) // Allinea il testo al centro
                        .lineLimit(nil) // Permetti linee multiple
                        .padding()
                        .frame(maxWidth: 360, maxHeight: 240)
                }
                
                ZStack {
                    Rectangle()
                        .cornerRadius(20)
                        .frame(width: 370, height: 270)
                        .foregroundStyle(Color(.systemGray6))
                    
                    ImagePickerView()
                        .disabled(true)
                }
                
                Spacer()
            }
        }
        .navigationBarHidden(true)
        .onAppear {
            // Verifica i dati e confronta le date
            print("Selected date:", DateManager.formattedDate(selectedDate))
        }
        
    }
    
}



#Preview {
    DayDetailsView(selectedDate: Date())
}
