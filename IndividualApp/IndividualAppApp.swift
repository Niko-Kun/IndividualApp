//
//  IndividualAppApp.swift
//  IndividualApp
//
//  Created by Nicolò Amabile on 03/12/24.
//

import SwiftUI
import SwiftData

@main
struct IndividualAppApp: App {    
    var body: some Scene {
        WindowGroup {
            ToolbarView()
                .preferredColorScheme(.light)
        }
        .modelContainer(for: Day.self)
//        .modelContainer(for: Streak.self)
    }
}
