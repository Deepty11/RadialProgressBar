//
//  ControlButtonView.swift
//  RadialProgressBar
//
//  Created by Rehnuma Reza Deepty on 21/9/23.
//

import SwiftUI

enum ButtonType {
    case timerAddition
    case control
}

struct ControlButtonView: View {
    var isStarted: Bool
    var onTappedControlButton: () -> Void
    var onTappedAdditionButton: () -> Void
    
    var body: some View {
        HStack {
            // ADDITION
            Button {
                onTappedAdditionButton()
            } label: {
                Text("+ 1:00")
                    .foregroundColor(.white)
                    .padding()
            }
            .background(Color.cyan.opacity(0.8))
            .cornerRadius(8)
            
            // CONTROL
            Button {
                onTappedControlButton()
            } label: {
                Text(isStarted ? "Pause" : "Start")
                    .foregroundColor(.white)
                    .padding()
            }
            .background(Color.red)
            .cornerRadius(8)
        }
    }
}

struct ControlButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ControlButtonView(
            isStarted: false,
            onTappedControlButton: {
                print("control button pressed")
            },
            onTappedAdditionButton: {
                print("added")
            })
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
