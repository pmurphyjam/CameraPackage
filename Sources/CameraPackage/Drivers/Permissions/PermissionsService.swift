//
//  PermissionsService.swift
//  CameraPackage
//
//  Created by Pat Murphy on 10/20/23.
//  The MIT License (MIT)
//
import Foundation
import Combine
import AVFoundation
import Photos

final class PermissionsService: ObservableObject {
    @Published var cameraAction: CameraAction?
    @Published var photoLibraryAction: PhotoLibraryAction?

    private var subscriptions = Set<AnyCancellable>()

    init() {
        photoLibraryChangePermissionPublisher
            .sink { [weak self] in
                self?.checkPhotoLibraryAuthorizationStatus()
            }
            .store(in: &subscriptions)

        cameraChangePermissionPublisher
            .sink { [weak self] in
                self?.checkCameraAuthorizationStatus()
            }
            .store(in: &subscriptions)
    }

    func askLibraryPermissionIfNeeded() {
        checkPhotoLibraryAuthorizationStatus()
    }

    /// photoLibraryChangePermissionPublisher gets called multiple times even when nothing changed in photo library, so just use this one to make sure the closure runs exactly once
    static func requestPermission(_ permissionGrantedClosure: @escaping ()->()) {
        PHPhotoLibrary.requestAuthorization { status in
            if status == .authorized || status == .limited {
                permissionGrantedClosure()
            }
        }
    }
}

private extension PermissionsService {
    func checkCameraAuthorizationStatus() {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        handle(camera: status)
    }

    func handle(camera status: AVAuthorizationStatus) {
        var result: CameraAction?
#if targetEnvironment(simulator)
        result = .unavailable
#else
        switch status {
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { [weak self] _ in
                self?.checkCameraAuthorizationStatus()
            }
        case .restricted:
            result = .unavailable
        case .denied:
            result = .authorize
        case .authorized:
            // Do nothing
            break
        @unknown default:
            result = .unknown
        }
#endif
        DispatchQueue.main.async { [weak self] in
            self?.cameraAction = result
        }
    }

    func checkPhotoLibraryAuthorizationStatus() {
        let status = PHPhotoLibrary.authorizationStatus(for: .readWrite)
        handle(photoLibrary: status)
    }

    func handle(photoLibrary status: PHAuthorizationStatus) {
        var result: PhotoLibraryAction?
        switch status {
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { [weak self] status in
                self?.handle(photoLibrary: status)
            }
        case .restricted:
            // TODO: Make sure that access can't change when status == .restricted
            result = .unavailable
        case .denied:
            result = .authorize
        case .authorized:
            // Do nothing
            break
        case .limited:
            result = .selectMore
        @unknown default:
            result = .unknown
        }

        DispatchQueue.main.async { [weak self] in
            self?.photoLibraryAction = result
        }
    }
}

extension PermissionsService {
    enum CameraAction {
        case authorize
        case unavailable
        case unknown
    }

    enum PhotoLibraryAction {
        case selectMore
        case authorize
        case unavailable
        case unknown
    }
}
