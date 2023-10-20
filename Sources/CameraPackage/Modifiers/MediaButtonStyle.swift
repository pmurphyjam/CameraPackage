//
//  MediaButtonStyle.swift
//  CameraPackage
//
//  Created by Pat Murphy on 10/20/23.
//  The MIT License (MIT)
//
import Foundation
import SwiftUI

struct MediaButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration
            .label
            .opacity(configuration.isPressed ? 0.7 : 1.0)
    }
}
