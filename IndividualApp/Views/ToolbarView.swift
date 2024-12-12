//
//  ToolbarView.swift
//  IndividualApp
//
//  Created by Nicolò Amabile on 03/12/24.
//

import SwiftUI
import SwiftData

struct ToolbarView: View {
    
    @Environment(\.modelContext) private var context
    @Query private var days: [Day]
    
    var body: some View {
        VStack {
            TabView(selection: .constant(0)) {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                ChartView(data: days)
                    .tabItem {
                        Image(systemName: "chart.dots.scatter")
                        Text("Chart")
                    }
            }
            .accentColor(.purple)
        }
    }
}

#Preview {
    ToolbarView()
}
