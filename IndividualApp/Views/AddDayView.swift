//
//  AddDayView.swift
//  IndividualApp
//
//  Created by Nicolò Amabile on 05/12/24.
//

import SwiftUI

struct AddDayView: View {
    var day : Day? = nil
    var add : (_ day: Day) -> Void
    
    @State private var whatDay : String = ""
    @State private var whatMonth : String = ""
    @State private var whatYear : String = ""
    
    @State var notes : String = ""
    
    @State private var selectedMood = Emotion.sad
    
    @Binding var showModal: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    Rectangle()
                        .cornerRadius(20)
                        .frame(width: 370, height: 100)
                        .foregroundStyle(.gray)
                        .shadow(radius: 10)
                    
                    Picker("Mood of today", selection: $selectedMood) {
                        ForEach(Emotion.allCases, id: \.self) { emotion in
                            Text(emotion.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                    .shadow(radius: 10)
                    .frame(width: 350, height: 100)
                }
                
                ZStack {
                    Rectangle()
                        .cornerRadius(20)
                        .frame(width: 370, height: 250)
                        .foregroundStyle(.gray)
                        .shadow(radius: 10)
                    
                    TextField("How are you feeling today?", text: $notes)
                        .bold()
                        .multilineTextAlignment(.center)
                        .frame(width: 350, height: 250)
                }
                
                ZStack {
                    Rectangle()
                        .cornerRadius(20)
                        .frame(width: 370, height: 300)
                        .foregroundStyle(.gray)
                        .shadow(radius: 10)
                    
                    ImagePickerView()
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
                        
                        let newDay = Day(
                            emotion: selectedMood.rawValue,
                            whatDay: whatDay,
                            whatMonth: whatMonth,
                            whatYear: whatYear,
                            notes : notes)
                        
                        add(newDay)
                        showModal = false
                    }
                    .foregroundStyle(.purple)
                    .padding()
                }
            }
        }
    }
}

#Preview {
    AddDayView(
        add: {day in },
        showModal: .constant(true)
    )
}
