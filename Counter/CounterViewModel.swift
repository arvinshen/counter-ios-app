//
//  CounterViewModel.swift
//  Counter
//
//  Created by Arvin Shen on 11/4/23.
//

import Foundation
import SwiftData

@Observable
class CounterViewModel {
    private var model: Counter = Counter(name: "", count: 0, step: 1, reset: 0, timestamp: Date())
    var modelContext: ModelContext
    var counters = [Counter]()

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        fetchData()
    }

    func addSample() {
        let counter = Counter(name: "Johnny Test", count: 0, step: 1, reset: 0, timestamp: Date())
        modelContext.insert(counter)
        fetchData()
    }

    func fetchData() {
        do {
            let descriptor = FetchDescriptor<Counter>(sortBy: [SortDescriptor(\.name)])
            counters = try modelContext.fetch(descriptor)
        } catch {
            print("Fetch failed")
        }
    }
}
