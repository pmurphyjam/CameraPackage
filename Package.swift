// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

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
