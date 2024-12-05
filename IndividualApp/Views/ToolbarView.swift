//
//  ToolbarView.swift
//  IndividualApp
//
//  Created by Nicolò Amabile on 03/12/24.
//

import SwiftUI

extension UITabBar {
    static func setTransparentTabBar() {
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground() // Transparent background
        appearance.backgroundColor = UIColor.clear
        appearance.shadowImage = UIImage() // No shadow
        appearance.shadowColor = nil
        
        UITabBar.appearance().scrollEdgeAppearance = appearance
        UITabBar.appearance().standardAppearance = appearance
    }
}

struct ToolbarView: View {
    @State private var showModal = false
    @State private var selectedTab = 0
    
    init() {
        UITabBar.setTransparentTabBar()
    }
    
    var body: some View {
        VStack {
            TabView(selection: $selectedTab) {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("")
                    }
                    .tag(0)
                HomeView()
                    .tabItem {
                        Image(systemName: "plus.circle")
                        Text("")
                    }
                    .tag(1)
                HomeView()
                    .tabItem {
                        Image(systemName: "chart.dots.scatter")
                        Text("")
                    }
                    .tag(2)
            }
            .accentColor(.purple)
            .onChange(of: selectedTab) { newValue in
                if newValue == 1 {
                    showModal = true
                    selectedTab = 0
                }
            }
            .sheet(isPresented: $showModal) {
                AddDayView(add: {day in}, showModal: $showModal)
            }
        }
    }
}

#Preview {
    ToolbarView()
}
