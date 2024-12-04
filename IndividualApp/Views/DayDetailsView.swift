//
//  DayDetailsView.swift
//  IndividualApp
//
//  Created by Nicolò Amabile on 04/12/24.
//

import SwiftUI

struct DayDetailsView: View {
    @State private var notes: String = ""
    
    @State private var selectedMood = 0
    let options = ["☹️", "😐", "🙂", "😁", "🥰"]
    
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
                        ForEach(0..<options.count, id: \.self) { index in
                            Text(options[index])
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
                }
                
                ZStack {
                    Rectangle()
                        .cornerRadius(20)
                        .frame(width: 370, height: 300)
                        .foregroundStyle(.gray)
                        .shadow(radius: 10)
                    
                    ImagePickerView()
                }
                
                Spacer()
                
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    DayDetailsView()
}
