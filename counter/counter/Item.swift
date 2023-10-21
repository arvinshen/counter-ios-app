//
//  Item.swift
//  Counter
//
//  Created by Arvin Shen on 10/17/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date

    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
