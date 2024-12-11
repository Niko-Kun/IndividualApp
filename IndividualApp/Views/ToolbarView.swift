//
//  ToolbarView.swift
//  IndividualApp
//
//  Created by Nicolò Amabile on 03/12/24.
//

import SwiftUI

struct ToolbarView: View {
    var body: some View {
        VStack {
            TabView(selection: .constant(0)) {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                ChartView()
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
