//
//  AddDayView.swift
//  IndividualApp
//
//  Created by Nicolò Amabile on 05/12/24.
//

import SwiftUI
import SwiftData
import PhotosUI

struct AddDayView: View {
    
    @Environment(\.modelContext) private var context
    
    var day : Day? = nil
    
    @State private var whatDay : String = ""
    @State private var whatMonth : String = ""
    @State private var whatYear : String = ""
    @State private var notes : String = ""
    @State private var dayImageData : Data?
    @State private var dayImage : PhotosPickerItem?
    
    @State private var selectedMood: Emotion = .normal
    
    @Binding var showModal: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Talk about your Day!")
                    .font(.title2)
                    .bold()
                
                ZStack {
                    Rectangle()
                        .cornerRadius(20)
                        .frame(width: 370, height: 100)
                        .foregroundStyle(Color(.systemGray6))
                    
                    Picker("Mood of today", selection: $selectedMood) {
                        ForEach(Emotion.allCases, id: \.self) { emotion in
                            Text(emotion.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                    .frame(width: 350, height: 100)
                }
                
                ZStack {
                    Rectangle()
                        .cornerRadius(20)
                        .frame(width: 370, height: 250)
                        .foregroundStyle(Color(.systemGray6))
                    
                    TextEditor(text: $notes)
                        .multilineTextAlignment(.center)
                        .frame(width: 360, height: 240, alignment: .center)
                        .colorMultiply(Color(.systemGray6))
                        .accessibilityLabel("Add Text")
                }
                
                ZStack {
                    Rectangle()
                        .cornerRadius(20)
                        .frame(width: 370, height: 270)
                        .foregroundStyle(Color(.systemGray6))
                    
                    PhotosPicker(selection: $dayImage,
                                 matching: .images, photoLibrary: .shared()) {
                        if let image = dayImageData {
                            let uiImage = UIImage(data: image)
                            Image(uiImage: uiImage!)
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 350, maxHeight: 250)
                                .clipShape(Rectangle())
                                .cornerRadius(20)
                                .padding()
                        } else {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .foregroundStyle(.black)
                                .frame(width: 100, height: 100)
                        }
                    }
                    .accessibilityLabel("Add an Image (optional)")
                }

                Spacer()
                
            }.onAppear {
                let currentDate = Date()
                let calendar = Calendar.current
                
                whatDay = String(calendar.component(.day, from: currentDate))
                whatMonth = String(calendar.component(.month, from: currentDate))
                whatYear = String(calendar.component(.year, from: currentDate))
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        
                        addDay()
                        showModal = false
                    }
                    .foregroundStyle(.purple)
                    .padding()
                }
            }
        }
        .task(id: dayImage) {
            if let data = try? await dayImage?.loadTransferable(type: Data.self) {
                dayImageData = data
            }
        }
    }
    
    func addDay() {
        let calendar = Calendar.current
        var components = DateComponents()
        components.day = Int(whatDay)
        components.month = Int(whatMonth)
        components.year = Int(whatYear)
        
        let dayDate = calendar.date(from: components) ?? Date()
        
        let fetchDescriptor = FetchDescriptor<Day>()
        
        // Retrieve existing data
        if let existingDay = try? context.fetch(fetchDescriptor).first(where: {
            Calendar.current.isDate($0.date, inSameDayAs: dayDate)
        }) {
            // Update instance
            existingDay.emotion = selectedMood
            existingDay.notes = notes
            existingDay.dayImage = dayImageData
        } else {
            // If not existing, create a new day
            let newDay = Day(
                date: dayDate,
                emotion: selectedMood,
                whatDay: whatDay,
                whatMonth: whatMonth,
                whatYear: whatYear,
                notes: notes,
                dayImage: dayImageData
            )
            context.insert(newDay)
        }
        
        // Saving
        do {
            try context.save()
            print("Dati aggiornati o aggiunti con successo")
        } catch {
            print("Errore durante il salvataggio dei dati: \(error)")
        }
    }
    
    //        print("Day added")
    //        print("Day:", whatDay)
    //        print("Month:", whatMonth)
    //        print("Year: ", whatYear)
}


#Preview {
    AddDayView(showModal: .constant(true))
}
