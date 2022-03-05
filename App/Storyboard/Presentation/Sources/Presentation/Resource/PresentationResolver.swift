//
//  PresentationResolver.swift
//  
//
//  Created by Maharjan Binish on 2022/02/22.
//

import Foundation
import DIKit

// MARK: Public Interface for exporting RootViewController outside Presentation Module
public protocol RootResolver {

    func resolveRoot() -> RootViewController
}

// MARK: Internal DIKit Resolver interface for Presentation Module
internal protocol PresentationResolver: Resolver {
    
    func providePresentationResolver() -> PresentationResolver
}

// MARK: Concrete Implementation for RootResolver
public final class RootResolverImpl: RootResolver {
    
    public init() {}

    public func resolveRoot() -> RootViewController {
        resolveRootViewController()
    }
}

// MARK: Concrete Implementation for PresentationResolver
extension RootResolverImpl: PresentationResolver {
    
    func providePresentationResolver() -> PresentationResolver {
        return self
    }
}

