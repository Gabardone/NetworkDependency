// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NetworkDependency",
    platforms: [
        // Minimum deployment version bound by `async/await` support.
        .iOS(.v13),
        .macCatalyst(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "NetworkDependency",
            targets: ["NetworkDependency"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Gabardone/GlobalDependencies", .upToNextMajor(from: "2.0.0")),
        // Depend on the swift documentation plugin to produce web-ready docs.
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.3.0")
    ],
    targets: [
        .target(
            name: "NetworkDependency",
            dependencies: ["GlobalDependencies"]
        ),
        .testTarget(
            name: "NetworkDependencyTests",
            dependencies: ["NetworkDependency"]
        )
    ]
)
