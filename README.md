# MiniDePin
[![Swift Package Manager compatible](https://img.shields.io/badge/SPM-compatible-4BC51D.svg?style=flat)](https://github.com/apple/swift-package-manager)
[![MIT License](https://img.shields.io/badge/SPM-compatible-4BC51D.svg?style=flat)](https://mit-license.org/)
[![Platforms](https://img.shields.io/badge/platform-ios%20%7C%20osx%20%7C%20watchos%20%7C%20tvos-%23989898)](https://apple.com/developer)

This is a simple network dependency to work on top of the GlobalDependencies package
(https://github.com/Gabardone/GlobalDependencies).

Since it's built to needs and so far I have just needed to get data from the network that's all it has right now. As
other facilities are needed its protocol will get new methods and its default implementation will make them work.

## Adoption

Adoption should follow the steps described in the documentation for GlobalDependencies, but since the dependency is
already built one just needs to add the import statement and the protocol conformance in the `dependencies` property for
types that do depend on this.

Look for steps #5 and #6 in the adoption documentation of GlobalDependencies if more detail is needed, at
https://github.com/Gabardone/GlobalDependencies/README.md

## Requirements

Since the default `SystemNetwork` implementation of the dependency protocol uses Swift concurrency, it is only supported
on those versions of Apple platforms that support the language feature (major OS versions released in 2019 or later). 

### Tools:

* Xcode 14.3 or later.
* Swift 5.8 or later.

### Platforms:

* iOS 13 or later.
* macOS Catalyst 13 or later (but why?).
* macOS 10.15 or later.
* tvOS 13 or later.
* watchOS 6 or later.

## Installation

NetworkDependency is currently only supported through Swift Package Manager.

If developing your own package, you can add the following lines to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/Gabardone/NetworkDependency", from: "1.0.0"),
]
```

To add to an Xcode project, paste `https://github.com/Gabardone/NetworkDependency` into the URL field for a new package
and specify "Up to next major version" starting with the current one.

## Contributing

If anyone decides to expand on this dependency (unsurprising as it's so limited so far) I would appreciate a PR with the
changes.

Same if anyone can come up with some unit tests for the existing logic. I was drawing a blank since there's so little of
it and it mostly calls the system frameworks.

Beyond that just take to heart the baseline rules presented in  [contributing guidelines](Contributing.md) prior to
submitting a Pull Request.

Thanks, and happy networking!

## Developing

Double-click on `Package.swift` in the root of the repository to open the project in Xcode.
