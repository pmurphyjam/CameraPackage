//
//  AlbumsProviderProtocol.swift
//  CameraPackage
//
//  Created by Pat Murphy on 10/20/23.
//  The MIT License (MIT)
//
import Foundation
import Combine

protocol AlbumsProviderProtocol {
    var albums: AnyPublisher<[AlbumModel], Never> { get }

    func reload()
}
