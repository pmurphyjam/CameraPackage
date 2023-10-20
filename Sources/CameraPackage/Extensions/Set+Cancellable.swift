//
//  Set+Cancellable.swift
//  CameraPackage
//
//  Created by Pat Murphy on 10/20/23.
//  The MIT License (MIT)
//
import Foundation
import Combine

extension Set where Element == AnyCancellable {
    mutating func cancelAll() {
        self = Set<AnyCancellable>()
    }
}
