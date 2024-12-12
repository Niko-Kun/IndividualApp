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
    @Query private var days: [Day]
    
    var body: some Scene {
        WindowGroup {
            ToolbarView(data: days)
                .preferredColorScheme(.light)
        }
        .modelContainer(for: Day.self)
    }
}
