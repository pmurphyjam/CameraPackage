//
//  MediaPickeerModel.swift
//  CameraPackage
//
//  Created by Pat Murphy on 10/20/23.
//  The MIT License (MIT)
//
import Foundation

public enum MediaPickerMode: Equatable {

    case photos
    case albums
    case album(Album)
    case camera
    case cameraSelection

    public static func == (lhs: MediaPickerMode, rhs: MediaPickerMode) -> Bool {
        switch (lhs, rhs) {
        case (.photos, .photos):
            return true
        case (.albums, .albums):
            return true
        case (.album(let a1), .album(let a2)):
            return a1.id == a2.id
        case (.camera, .camera):
            return true
        case (.cameraSelection, .cameraSelection):
            return true
        default:
            return false
        }
    }
}
