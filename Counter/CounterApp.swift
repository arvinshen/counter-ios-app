//
//  CounterApp.swift
//  Counter
//
//  Created by Arvin Shen on 10/17/23.
//

import SwiftData
import SwiftUI

@main
struct CounterApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Counter.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            CounterView()
        }
        .modelContainer(sharedModelContainer)
    }
}
