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
                        Text("Counter \(item.count) at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(item.name)
//                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                    .listRowSeparator(.hidden)
//                    .listRowBackground(
//                        RoundedRectangle(cornerRadius: 5)
//                            .padding(
//                                EdgeInsets(
//                                    top: 2,
//                                    leading: 10,
//                                    bottom: 2,
//                                    trailing: 10
//                                )
//                            )
//                    )
                }
                .onDelete(perform: deleteItems)
            }
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Counter", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            count += 1
            let newItem = Counter(name: "Counter \(count)", count: count, timestamp: Date())
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
