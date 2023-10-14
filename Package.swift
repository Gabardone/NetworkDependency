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
        .package(url: "https://github.com/Gabardone/GlobalDependencies", .branch("MacroSupport"))
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
