//
//  Types.swift
//  CameraPackage
//
//  Created by Pat Murphy on 10/20/23.
//  The MIT License (MIT)
//
import Foundation

public typealias MediaPickerCompletionClosure = ([Media]) -> Void
public typealias MediaPickerOrientationHandler = (ShouldLock) -> Void
public typealias SimpleClosure = ()->()

public enum ShouldLock {
    case lock, unlock
}
