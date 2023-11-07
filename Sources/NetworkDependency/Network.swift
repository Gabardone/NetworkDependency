//
//  Network.swift
//  MiniDepIn
//
//  Created by Óscar Morales Vivó on 1/16/23.
//

import Foundation
@_exported import GlobalDependencies

/**
 An abstract façade protocol for network operations.

 So far the only one we've needed is fetching data from a URL. Others will be added as needed.
 */
@Dependency()
public protocol Network {
    /**
     Returns a task that asynchronously fetches data from the given URL, or throws otherwise.
     - Parameter url: The url pointing to the data we want to fetch.
     - Returns: The data located at `url`.
     */
    func dataFor(url: URL) async throws -> Data
}

/**
 Adoption of Network.Dependency by GlobalDependencies
 */
extension GlobalDependencies: Network.Dependency {
    public #GlobalDependency(type: Network)
}

/**
 Default dependency value factory.
 */
private struct DefaultNetworkValueFactory: DefaultDependencyValueFactory {
    static func makeDefaultValue() -> SystemNetwork {
        return SystemNetwork()
    }
}
