//
//  View+NotificationCenter.swift
//  CameraPackage
//
//  Created by Pat Murphy on 10/20/23.
//  The MIT License (MIT)
//
import SwiftUI

extension View {

    func onEnteredBackground(perform: @escaping () -> Void) -> some View {
        let publisher = NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)
        return onReceive(publisher) { _ in perform() }
    }

    func onEnteredForeground(perform: @escaping () -> Void) -> some View {
        let publisher = NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)
        return onReceive(publisher) { _ in perform() }
    }

    func onRotate(perform: @escaping (UIDeviceOrientation) -> Void) -> some View {
        let publisher = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
        return onReceive(publisher) { _ in perform(UIDevice.current.orientation) }
    }

}
