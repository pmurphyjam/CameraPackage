//
//  LiveCameraCell.swift
//  CameraPackage
//
//  Created by Pat Murphy on 10/20/23.
//  The MIT License (MIT)
//
import SwiftUI

struct LiveCameraCell: View {

    let action: () -> Void
    
    @StateObject private var liveCameraViewModel = LiveCameraViewModel()
    @State private var orientation = UIDevice.current.orientation
    
    var body: some View {
        Button {
            action()
        } label: {
            LiveCameraView(
                session: liveCameraViewModel.captureSession,
                videoGravity: .resizeAspectFill,
                orientation: orientation
            )
            .overlay(
                Image(systemName: "camera")
                    .foregroundColor(.white)
            )
        }
        .onEnteredBackground(perform: liveCameraViewModel.stopSession)
        .onEnteredForeground(perform: liveCameraViewModel.startSession)
        .onRotate { orientation = $0 }
    }
}
