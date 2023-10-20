//
//  MediaModelProtocol.swift
//  CameraPackage
//
//  Created by Pat Murphy on 10/20/23.
//  The MIT License (MIT)
//
import SwiftUI

protocol MediaModelProtocol {
    var mediaType: MediaType? { get }
    var duration: CGFloat? { get }

    func getURL() async -> URL?
    func getThumbnailURL() async -> URL?

    func getData() async throws -> Data?
    func getThumbnailData() async -> Data?
}
