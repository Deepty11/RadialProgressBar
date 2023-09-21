//
//  ClockView.swift
//  RadialProgressBar
//
//  Created by Rehnuma Reza Deepty on 21/9/23.
//

import SwiftUI

struct ClockView: View {
     @Binding var counter: Double
    
    var timerText: String {
        counter == 60 ? "1:00" : "\(Int(counter))"
    }
    var circleBGColor: Color = .accentColor
    var isStarted: Bool = false {
        didSet {
            if isStarted == true && counter == 0 {
                counter = 60
            }
        }
    }
    
    var onRefresh: (() -> Void)? = nil
    
    var body: some View {
        ZStack {
            CircularTimerView(
                progress: counter/60,
                backgroundColor: circleBGColor)
            Text("\(timerText)")
                .font(.system(size: 50)).bold()
                .foregroundColor(
                    isStarted
                    ?.primary
                    : .secondary)
            Image(systemName: "arrow.clockwise.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 40,
                       height: 40)
                .foregroundColor(.cyan)
                .onTapGesture {
                    onRefresh?()
                }
                .offset(y: 66)
        }
    }
}

struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView(counter: .constant(3.0))
    }
}
