//
//  DayDetailsView.swift
//  IndividualApp
//
//  Created by Nicolò Amabile on 04/12/24.
//

import SwiftUI

struct DayDetailsView: View {
    let notes : String = ""
    
    @State private var selectedMood = Emotion.sad
    
    var body: some View {
        NavigationStack {
            VStack {
                Toolbar()
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
                    .disabled(true)
                    .shadow(radius: 10)
                    .frame(width: 350, height: 100)
                }
                
                ZStack {
                    Rectangle()
                        .cornerRadius(20)
                        .frame(width: 370, height: 250)
                        .foregroundStyle(.gray)
                        .shadow(radius: 10)
                    
                    Text(notes)
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding()
                }
                
                ZStack {
                    Rectangle()
                        .cornerRadius(20)
                        .frame(width: 370, height: 300)
                        .foregroundStyle(.gray)
                        .shadow(radius: 10)
                    
                    ImagePickerView()
                }
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    DayDetailsView()
}
