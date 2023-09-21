//
//  DeviceOrientationModifier.swift
//  RadialProgressBar
//
//  Created by Rehnuma Reza Deepty on 21/9/23.
//

import Foundation
import SwiftUI

struct DeviceOrientationModifier: ViewModifier {
    @Binding var orientation: UIDeviceOrientation
    
    func body(content: Content) -> some View {
        content
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                orientation  = UIDevice.current.orientation
            }
    }
}

extension View {
    func detectDeviceOrientation(_ orientation: Binding<UIDeviceOrientation>) -> some View {
        modifier(DeviceOrientationModifier(orientation: orientation))
    }
}
