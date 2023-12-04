//
//  CounterDetailView.swift
//  Counter
//
//  Created by Arvin Shen on 11/20/23.
//

import SwiftData
import SwiftUI

struct CounterDetailView: View {
    @Environment(\.modelContext) private var modelContext
    var item: Counter

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("\(item.count)")
                    .frame(width: 200, height: 200)
                    .scaledToFill()
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
                HStack {
                    Button(action: decrement) {
                        Label("", systemImage: "minus.circle")
                    }
                    Button(action: reset) {
                        Label("", systemImage: "arrow.counterclockwise.circle")
                    }
                    Button(action: increment) {
                        Label("", systemImage: "plus.circle")
                    }
                }
                Spacer()
            }
        }
        .navigationTitle(item.name)
    }

    private func decrement() {
        item.count -= item.step
    }

    private func reset() {
        item.count = item.reset
    }

    private func increment() {
        item.count += item.step
    }
}

#Preview {
    CounterDetailView(item: Counter.preview)
}
