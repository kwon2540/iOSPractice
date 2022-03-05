//
//  DataResolver.swift
//  
//
//  Created by Maharjan Binish on 2022/02/22.
//

import Foundation
import DIKit

// MARK: Public Interface for exporting Repositories outside Data Module
public protocol RepositoryResolver {
    
    func resolveGithubRepository() -> DefaultGithubRepository
}

// MARK: Internal DIKit Resolver interface for Data Module
internal protocol DataResolver: Resolver {
    
}

// MARK: Concrete Implementation for RepositoryResolver
public final class RepositoryResolverImpl: RepositoryResolver {
    
    public func resolveGithubRepository() -> DefaultGithubRepository {
        resolveDefaultGithubRepository()
    }
}

// MARK: Concrete Implementation for DataResolver
extension RepositoryResolverImpl: DataResolver {}
