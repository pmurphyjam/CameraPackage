//
//  OrientationTransformationExtensions.swift
//  CameraPackage
//
//  Created by Pat Murphy on 10/20/23.
//  The MIT License (MIT)
//
import UIKit
import AVFoundation

extension UIImage.Orientation {

    init(_ deviceOrientation: UIDeviceOrientation) {
        switch deviceOrientation {
        case .landscapeLeft: self = .up
        case .landscapeRight: self = .down
        case .portraitUpsideDown: self = .left
        default: self = .right
        }
    }

    static var `default`: UIImage.Orientation { .right }
}

extension AVCaptureVideoOrientation {

    init(_ orientation: UIDeviceOrientation) {
        switch orientation {
        case .landscapeLeft: self = .landscapeRight
        case .landscapeRight: self = .landscapeLeft
        default: self = .portrait
        }
    }

}
