//
//  Counter.swift
//  Counter
//
//  Created by Arvin Shen on 10/17/23.
//

import Foundation
import SwiftData

@Model
final class Counter {
    var name: String
    var count: Int
    var step: Int
    var reset: Int
    var timestamp: Date

    init(name: String, count: Int, step: Int, reset: Int, timestamp: Date) {
        self.name = name
        self.count = count
        self.step = step
        self.reset = reset
        self.timestamp = timestamp
    }
    
    static let preview: Counter = {
        Counter(name: "Johnny Test", count: 0, step: 1, reset: 0, timestamp: Date())
    }()
    
    @MainActor
    static let previewContainer: ModelContainer = {
        do {
            let config = ModelConfiguration(isStoredInMemoryOnly: true)
            let container = try ModelContainer(for: Counter.self, configurations: config)

            for i in 1...9 {
                let counter = Counter(name: "Example User \(i)", count: i, step: i, reset: 0, timestamp: Date())
                container.mainContext.insert(counter)
            }

            return container
        } catch {
            fatalError("Failed to create model container for previewing: \(error.localizedDescription)")
        }
    }()
}
