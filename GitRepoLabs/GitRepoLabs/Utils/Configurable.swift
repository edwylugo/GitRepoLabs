//
//  Configurable.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 03/08/24.
//

import Foundation

/// `associatedtype` is a generic type that you can define to be replaced by a specific type when the protocol is adopted. In the case of `Configurable`, `Configuration` represents the data type that will be used to configure the object that adopts this protocol.
protocol Configurable: AnyObject {
    associatedtype Configuration

    func configure(content: Configuration)
}
