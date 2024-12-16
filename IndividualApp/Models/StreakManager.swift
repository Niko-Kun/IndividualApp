////
////  StreakManager.swift
////  IndividualApp
////
////  Created by Nicolò Amabile on 15/12/24.
////
//
//import SwiftUI
//import SwiftData
//
//class StreakManager {
//    let context : ModelContext
//    
//    init(context: ModelContext) {
//        self.context = context
//    }
//    func updateStreak() async {
//            // Recupera il primo record dal database
//            if let streak = try? context.fetch(FetchDescriptor<Streak>()).first {
//                // Aggiorna lo streak
//                let calendar = Calendar.current
//                let now = Date()
//                let daysDifference = calendar.dateComponents([.day], from: streak.lastAccess, to: now).day ?? 0
//                
//                if daysDifference == 1 {
//                    // Incrementa lo streak corrente
//                    streak.currentStreak += 1
//                    // Aggiorna il massimo streak
//                    if streak.currentStreak > streak.maxStreak {
//                        streak.maxStreak = streak.currentStreak
//                    }
//                } else if daysDifference > 1 {
//                    // Resetta lo streak
//                    streak.currentStreak = 0
//                }
//                
//                // Aggiorna la data di ultimo accesso
//                streak.lastAccess = now
//                try? context.save()
//            } else {
//                // Crea il record iniziale
//                let newStreak = Streak(lastAccess: Date(), currentStreak: 1, maxStreak: 1)
//                context.insert(newStreak)
//                try? context.save()
//            }
//        }
//        
//        func getCurrentStreak() async -> Int {
//            if let streak = try? context.fetch(FetchDescriptor<Streak>()).first {
//                return streak.currentStreak
//            }
//            return 0
//        }
//        
//        func getMaxStreak() async -> Int {
//            if let streak = try? context.fetch(FetchDescriptor<Streak>()).first {
//                return streak.maxStreak
//            }
//            return 0
//        }
//}
//
