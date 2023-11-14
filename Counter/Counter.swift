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
    var timestamp: Date

    init(name: String, count: Int, timestamp: Date) {
        self.name = name
        self.count = count
        self.timestamp = timestamp
    }
}
