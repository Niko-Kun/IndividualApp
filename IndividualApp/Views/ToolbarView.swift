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
    
    init() {
        UITabBar.setTransparentTabBar()
    }
    
    var body: some View {
        VStack {
            TabView(selection: .constant(0)) {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("")
                    }
                HomeView()
                    .tabItem {
                        Image(systemName: "chart.dots.scatter")
                        Text("")
                    }
            }
            .accentColor(.purple)
        }
    }
}

#Preview {
    ToolbarView()
}
