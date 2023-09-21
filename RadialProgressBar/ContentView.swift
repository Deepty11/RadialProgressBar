//
//  ContentView.swift
//  RadialProgressBar
//
//  Created by Rehnuma Reza Deepty on 20/9/23.
//

import SwiftUI

struct ContentView: View  {
    @State private var counter: Double = 60 
    @State private var isStarted: Bool = false 
    @State private var timer: Timer? = nil
    @State private var circleBGColor: Color = .yellow.opacity(0.10)
    @State private var orientation: UIDeviceOrientation = UIDevice.current.orientation
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                if orientation.isLandscape {
                    HStack(alignment: .center) {
                        ClockView(
                            counter: $counter,
                            circleBGColor: circleBGColor,
                            isStarted: isStarted) {
                                counter = 60
                                isStarted = false
                                timer?.invalidate()
                            }
                        ControlButtonView(isStarted: $isStarted) { _ in
                            startCounter()
                        }
                    }
                } else {
                    VStack(alignment: .center) {
                        ClockView(
                            counter: $counter,
                            circleBGColor: circleBGColor,
                            isStarted: isStarted) {
                                counter = 60
                                isStarted = false
                                timer?.invalidate()
                            }
                        ControlButtonView(isStarted: $isStarted) { _ in
                            startCounter()
                        }
                    }
                }
            }
            .detectDeviceOrientation($orientation)
            .navigationTitle("Timer")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func startCounter() {
       timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if isStarted {
                if counter > 0 {
                    counter -= 1
                } else {
                    isStarted = false
                    timer.invalidate()
                }
            } else {
                timer.invalidate()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
