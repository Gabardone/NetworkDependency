//
//  MockNetwork.swift
//
//
//  Created by Óscar Morales Vivó on 5/28/23.
//

import Foundation

/**
 Simple mock for network data access. Use it in tests as an override of `NetworkDependency`.

 This should go into its own package but that causes issues where the compiler gets confused in test targets and
 dependency overrides fail to work.
  */
public struct MockNetwork {
    public init(dataForURLOverride: ((URL) async throws -> Data)? = nil) {
        self.dataForURLOverride = dataForURLOverride
    }

    /**
     Throw this when the error is due to the mock setup not matching the test behavior.
     */
    public enum MockError: Error {
        case unexpectedCall(String)
    }

    var dataForURLOverride: ((URL) async throws -> Data)?
}

extension MockNetwork: Network {
    public func dataFor(url: URL) async throws -> Data {
        if let dataForURLOverride {
            return try await dataForURLOverride(url)
        } else {
            throw MockError.unexpectedCall(#function)
        }
    }
}
