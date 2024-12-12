//
//  DayDetailsView.swift
//  IndividualApp
//
//  Created by Nicolò Amabile on 04/12/24.
//

import SwiftUI
import SwiftData
import PhotosUI
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
                            // Update the day into local data
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
                        .multilineTextAlignment(.center) // Align text to center
                        .lineLimit(nil) // Allows multiple lines
                        .padding()
                        .frame(maxWidth: 360, maxHeight: 240)
                }
                
                ZStack {
                    Rectangle()
                        .cornerRadius(20)
                        .frame(width: 370, height: 270)
                        .foregroundStyle(Color(.systemGray6))
                    
                    if let image = days.first(where: { day in
                        Calendar.current.isDate(day.date, inSameDayAs: selectedDate)
                    })?.dayImage {
                            let uiImage = UIImage(data: image)
                            Image(uiImage: uiImage!)
                                .resizable()
                                .frame(maxWidth: 360, maxHeight: 260)
                                .accessibilityLabel("User Image")
                                .clipShape(Rectangle())
                                .cornerRadius(20)
                        } else {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .foregroundStyle(.black)
                                .frame(width: 100, height: 100)
                                .accessibilityLabel("No Image")
                        }
                        
                }
                Spacer()
            }
        }
        .navigationBarHidden(true)
//        .onAppear {
//            // Verifica i dati e confronta le date
//            print("Selected date:", DateManager.formattedDate(selectedDate))
//        }
        
    }
    
}



#Preview {
    DayDetailsView(selectedDate: Date())
}
