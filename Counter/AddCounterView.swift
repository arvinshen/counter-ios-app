//
//  AddCounterView.swift
//  Counter
//
//  Created by Arvin Shen on 11/13/23.
//

import SwiftUI

struct AddCounterView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var name: String = ""
    @State private var value: Int?
    @State private var step: Int = 1
    @State private var reset: Int = 0
    
    var body: some View {
        Form {
            HStack {
                Text(L10n.Counter.Add.Input.Name.text)
                TextField(L10n.Counter.Add.Input.Name.text, text: $name, prompt: Text(L10n.Counter.Add.Input.Name.placeholder))
            }
            HStack {
                Text(L10n.Counter.Add.Input.Value.text)
                TextField(value: $value, format: .number, prompt: Text(L10n.Counter.Add.Input.Value.placeholder)) {
                    
                }
                .keyboardType(.numberPad)
            }
            VStack {
                HStack {
                    Text(L10n.Counter.Add.Input.Step.text)
                    Spacer()
                }
                Stepper("\(step)", value: $step, in: 0...100, step: 1)
            }
            HStack {
                Text(L10n.Counter.Add.Input.Reset.text)
                TextField(value: $reset, format: .number, prompt: Text(L10n.Counter.Add.Input.Reset.placeholder)) {
                    
                }
                .keyboardType(.numberPad)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: saveCounter) {
                    Text(L10n.Common.Controls.Actions.save)
                }
            }
        }
    }
    
    private func saveCounter() {
        let newItem = Counter(name: name, count: value ?? 0, step: step, reset: reset, timestamp: Date())
        modelContext.insert(newItem)
        dismiss()
    }
}

#Preview {
    AddCounterView()
}
