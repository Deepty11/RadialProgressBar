//
//  ControlButtonView.swift
//  RadialProgressBar
//
//  Created by Rehnuma Reza Deepty on 21/9/23.
//

import SwiftUI

struct ControlButtonView: View {
    @Binding var isStarted: Bool
    var onTapped: ((Binding<Bool>) -> Void)? = nil
    
    var body: some View {
        Button {
            isStarted.toggle()
            onTapped?($isStarted)
        } label: {
            Text(isStarted ? "Pause" : "Start")
                .foregroundColor(.white)
                .padding()
        }
        .background(Color.red)
        .cornerRadius(8)
    }
}

struct ControlButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ControlButtonView(isStarted: .constant(false))
    }
}
