// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NetworkDependency",
    platforms: [
        .iOS(.v11),
        .macCatalyst(.v13),
        .macOS(.v10_13),
        .tvOS(.v11),
        .watchOS(.v4)
    ],
    products: [
        .library(
            name: "NetworkDependency",
            targets: ["NetworkDependency"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Gabardone/GlobalDependencies", from: "2.0.0")
    ],
    targets: [
        .target(
            name: "NetworkDependency",
            dependencies: ["GlobalDependencies"]
        )
        .testTarget(
            name: "NetworkDependencyTests",
            dependencies: ["GlobalDependencies"]
        )
    ]
)
