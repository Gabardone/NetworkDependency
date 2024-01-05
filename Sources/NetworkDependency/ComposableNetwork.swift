//
//  ComposableNetwork.swift
//
//
//  Created by Óscar Morales Vivó on 5/28/23.
//

import Foundation

/**
 A simple value type that implements `Network` through functional injection.

 Use this to build custom implementations of `Network` that can be simply expressed with an encapsulated action.
 Awfully convenient for test mocking as well.
 */
public struct ComposableNetwork {
    public init(dataForURLOverride: @escaping (URL) async throws -> Data) {
        self.dataForURLOverride = dataForURLOverride
    }

    public var dataForURLOverride: (URL) async throws -> Data
}

extension ComposableNetwork: Network {
    public func dataFor(url: URL) async throws -> Data {
        try await dataForURLOverride(url)
    }
}
