//
//  Package.swift
//  CameraPackage
//
//  Created by Pat Murphy on 10/20/23.
//  The MIT License (MIT)
//

import PackageDescription

let package = Package(
    name: "CameraPackage",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "CameraPackage",
            targets: ["CameraPackage"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "CameraPackage",
            dependencies: []
        ),
        .testTarget(
            name: "CameraTests",
            dependencies: ["CameraPackage"]),
    ]
)
