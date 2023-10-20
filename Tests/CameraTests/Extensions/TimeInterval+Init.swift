//
//  TimeInterval+Init.swift
//  CameraPackage
//
//  Created by Pat Murphy on 10/20/23.
//  The MIT License (MIT)
//
import Foundation

extension TimeInterval {
    init(days: Double = 0, hours: Double = 0, minutes: Double = 0, seconds: Double = 0) {
        self = days * 60 * 60 * 24 + hours * 60 * 60 + minutes * 60 + seconds
    }
}
