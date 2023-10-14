//
//  NetworkDependency.swift
//
//
//  Created by Óscar Morales Vivó on 5/28/23.
//

import Foundation
@_exported import GlobalDependencies

/**
 A protocol to adopt for dependencies that require access to the network.
 */
public protocol NetworkDependency: Dependencies {
    var network: any Network { get }
}

public struct NetworkDependencyKey: DependencyKey {
    public static let defaultValue: any Network = SystemNetwork()
}

extension GlobalDependencies: NetworkDependency {
    public var network: any Network {
        resolveDependencyFor(key: NetworkDependencyKey.self)
    }
}
