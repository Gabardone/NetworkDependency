//
//  SystemNetwork.swift
//  MiniDepIn
//
//  Created by Óscar Morales Vivó on 3/29/23.
//

import Foundation

/**
 An implementation of the `Network` protocol that uses the system facilities, namely a `URLSession` instance, to fetch
 data.

 By default they are created using `URLSession.shared` but the option exists to use a different one.
 */
public struct SystemNetwork {
    public init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }

    public let urlSession: URLSession
}

extension SystemNetwork: Network {
    public func dataFor(url: URL) async throws -> Data {
        let (data, _) = try await urlSession.data(from: url)
        return data
    }
}
