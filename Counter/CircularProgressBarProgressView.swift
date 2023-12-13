//
//  CircularProgressBarProgressView.swift
//  Counter
//
//  Created by Arvin Shen on 12/4/23.
//

import SwiftUI

struct CircularProgressBarProgressView: View {
    let total: Int
    let completed: Int
    @State var lineWidth: CGFloat = 16
    @State var color: Color = .green
    let scale: CGFloat = 8
    
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: CGFloat(completed)/CGFloat(total))
                .stroke(color,
                        style: StrokeStyle(
                            lineWidth: lineWidth,
                            lineCap: .round
                        ))
                .rotationEffect(.degrees(-90))
                .padding(lineWidth / 2)
            Text("\(completed)")
                .fontWeight(.bold)
                .font(.system(size: 16 * scale))
        }
    }
}

#Preview {
    Group {
        CircularProgressBarProgressView(total: 6, completed: 0)
        CircularProgressBarProgressView(total: 6, completed: 4)
        CircularProgressBarProgressView(total: 6, completed: 6)
    }
    .previewLayout(.fixed(width: 400, height: 400))
}
