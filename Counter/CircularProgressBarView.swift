//
//  CircularProgressBarView.swift
//  Counter
//
//  Created by Arvin Shen on 12/4/23.
//

import SwiftUI

struct CircularProgressBarView: View {
    let total: Int
    let completed: Int
    @State var lineWidth: CGFloat = 16
    @State var color: Color = .green
    
    var body: some View {
        ZStack {
            CircularProgressBarBackgroundView(total: total, lineWidth: lineWidth)
            CircularProgressBarProgressView(total: total, completed: completed, lineWidth: lineWidth, color: color)
        }
    }
}

#Preview {
    CircularProgressBarView(total: 6, completed: 4)
        .previewLayout(.fixed(width: 400, height: 400))
}
