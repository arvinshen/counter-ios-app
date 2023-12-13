//
//  CounterView.swift
//  Counter
//
//  Created by Arvin Shen on 10/17/23.
//

import SwiftData
import SwiftUI

struct CounterView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Counter]
    @State private var count: Int = 0

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        CounterDetailView(item: item)
                    } label: {
                        Text(item.name)
                    }
                    .listRowSeparator(.hidden)
                }
                .onDelete(perform: deleteItems)
            }
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    NavigationLink(destination: AddCounterView()) {
                        Button(action: addItem) {
                            Label("Add Counter", systemImage: "plus")
                        }
                    }
                }
            }
            .navigationTitle(L10n.Counter.title)
            .navigationBarTitleDisplayMode(.inline)
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            count += 1
            let newItem = Counter(name: "Counter \(count)", count: count, step: 1, reset: 0, goal: 100, timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    CounterView()
        .modelContainer(for: Counter.self, inMemory: true)
}
