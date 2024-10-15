// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GloboIDVision",
    platforms: [
        .visionOS(.v1),
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "GloboIDVision",
            targets: ["GloboIDVision"]),
    ],
    targets: [
        .target(
            name: "GloboIDVision"),
    ]
)
