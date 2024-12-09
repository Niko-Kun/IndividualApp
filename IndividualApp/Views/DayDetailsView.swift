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
    
    var filteredDay = Calendar.current.component(.day, from: Date())
    
    @State private var selectedMood: Emotion = .normal
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Toolbar()
                    
                    Spacer()
                    
                    Text(DateManager.formatter_dd_mm_yy(selectedDate))
                        .bold()
                        .frame(width: 170, height: 40)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    ZStack {
                        Rectangle()
                            .cornerRadius(20)
                            .frame(width: 370, height: 100)
                            .foregroundStyle(.gray)
                            .shadow(radius: 10)
                        
                        Picker("Mood of today", selection: $selectedMood) {
                            ForEach(Emotion.allCases, id: \.self) { emotion in
                                Text(emotion.rawValue.capitalized)
                            }
                        }
                        .pickerStyle(.segmented)
                        .disabled(true)
                        .shadow(radius: 10)
                        .frame(width: 350, height: 100)
                        .onAppear {
                            // Default Emotion
                            if let firstEmotion = days.first?.emotion {
                                selectedMood = firstEmotion
                            }
                        }
                        .onChange(of: selectedMood) { newValue in
                            // Update Emotion
                            if let firstDay = days.first {
                                firstDay.emotion = newValue
                            }
                        }
                    }
                    
                    ZStack {
                        Rectangle()
                            .cornerRadius(20)
                            .frame(width: 370, height: 250)
                            .foregroundStyle(.gray)
                            .shadow(radius: 10)
                        
                        Text(days.first?.notes ?? "Nessuna nota disponibile")
                            .bold()
                            .multilineTextAlignment(.center)
                            .padding()
                    }
                    
                    ZStack {
                        Rectangle()
                            .cornerRadius(20)
                            .frame(width: 370, height: 270)
                            .foregroundStyle(.gray)
                            .shadow(radius: 10)
                        
                        ImagePickerView()
                    }
                    Spacer()
                }
            }
        }
        .navigationBarHidden(true)
        .onAppear {
            // Verifica i dati e confronta le date
            print("Selected date:", DateManager.formattedDate(selectedDate))
            if filteredDay != nil {
                print("Filtered day found:", filteredDay)
            } else {
                print("No matching day found.")
            }
        }
    }
}

#Preview {
    DayDetailsView(selectedDate: Date())
}
