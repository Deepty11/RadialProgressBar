//
//  ClockView.swift
//  RadialProgressBar
//
//  Created by Rehnuma Reza Deepty on 21/9/23.
//

import SwiftUI

struct ClockView: View {
     @Binding var counter: Double
    var divider: Double = 60
    
    var timerText: String {
        let min: Int = Int(counter / 60)
        let sec: Int = Int(counter.truncatingRemainder(dividingBy: 60))
        
        if min < 1 {
            return "\(Int(counter))"
        }
        
        return "\(min):\(sec >= 10 ? "\(sec)" : "0\(sec)")"
    }
    var circleBGColor: Color = .yellow.opacity(0.10)
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
                progress: counter / divider,
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
