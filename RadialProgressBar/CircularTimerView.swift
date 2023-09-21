//
//  CirculerTimerView.swift
//  RadialProgressBar
//
//  Created by Rehnuma Reza Deepty on 20/9/23.
//

import SwiftUI

struct CircularTimerView: View {
    var progress: Double
    var backgroundColor: Color
    
    var body: some View {
        Circle()
            .stroke(Color.red.opacity(0.3), lineWidth: 20)
            .background(Circle().fill(backgroundColor))
            .padding(30)
            
        Circle()
            .trim(from: 0.0, to: progress)
            .stroke(Color.red.opacity(0.80), style: StrokeStyle(lineWidth: 20, lineCap: .round))
            .padding(30)
            .rotationEffect(Angle(degrees: -90))
            .animation(Animation.easeOut,
                       value: progress)
    }
}

struct CirculerTimerView_Previews: PreviewProvider {
    static var previews: some View {
        CircularTimerView(progress: 0.0,
                          backgroundColor: .cyan)
    }
}
