//
//  ToolbarView.swift
//  IndividualApp
//
//  Created by Nicolò Amabile on 03/12/24.
//


import SwiftUI

import SwiftUI

extension UITabBar {
    static func setTransparentTabBar() {
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground() // Sfondo trasparente
        appearance.backgroundColor = UIColor.clear
        appearance.shadowImage = UIImage() // Rimuove l'ombra
        appearance.shadowColor = nil
        
        UITabBar.appearance().scrollEdgeAppearance = appearance
        UITabBar.appearance().standardAppearance = appearance
    }
}

struct ToolbarView: View {
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
                        Image(systemName: "plus.circle")
                        Text("")
                    }
                HomeView()
                    .tabItem {
                        Image(systemName: "chart.dots.scatter")
                        Text("")
                    }
            }.accentColor(.purple)
        }
    }
}

#Preview {
    ToolbarView()
}
