//
//  IndividualAppApp.swift
//  IndividualApp
//
//  Created by Nicolò Amabile on 03/12/24.
//

import SwiftUI

@main
struct IndividualAppApp: App {
    init() {
        UITabBar.setTransparentTabBar()
    }
    
    var body: some Scene {
        WindowGroup {
            ToolbarView()
        }
    }
}
