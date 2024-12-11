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
    
    @State private var showModal = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    
                    CalendarView(selectedDate: selectedDate)
                }
            }
            .navigationBarItems(
                trailing: Button(action: {
                    showModal = true
                }) {
                    Text(Image(systemName: "plus"))
                        .bold()
                        .foregroundStyle(.purple)
                })
            .sheet(isPresented: $showModal) {
                AddDayView(showModal: $showModal)
            }

        }
        
    }
}

#Preview {
    HomeView()
}
