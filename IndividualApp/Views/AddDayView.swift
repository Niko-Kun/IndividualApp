//
//  AddDayView.swift
//  IndividualApp
//
//  Created by Nicolò Amabile on 05/12/24.
//

import SwiftUI
import SwiftData

struct AddDayView: View {
    
    @Environment(\.modelContext) private var context
    
    var day : Day? = nil
    
    @State private var whatDay : String = ""
    @State private var whatMonth : String = ""
    @State private var whatYear : String = ""
    @State private var notes : String = ""
    
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
                        .frame(width: 370, height: 300)
                        .foregroundStyle(Color(.systemGray6))
                    
                    ImagePickerView()
                        .accessibilityLabel("Add an Image (optional)")
                }
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
    }
    
    func addDay() {
        let calendar = Calendar.current
        var components = DateComponents()
        components.day = Int(whatDay)
        components.month = Int(whatMonth)
        components.year = Int(whatYear)
        
        let dayDate = calendar.date(from: components)
        
        // Create the variable
        let newDay = Day(
            date: dayDate ?? Date(),
            emotion: selectedMood,
            whatDay: whatDay,
            whatMonth: whatMonth,
            whatYear: whatYear,
            notes: notes)
        
        // Add to the local data
        context.insert(newDay)
//        print("Day added")
//        print("Day", whatDay)
//        print("Month:", whatMonth)
//        print("Year: ", whatYear)
    }
    
}

#Preview {
    AddDayView(showModal: .constant(true))
}
