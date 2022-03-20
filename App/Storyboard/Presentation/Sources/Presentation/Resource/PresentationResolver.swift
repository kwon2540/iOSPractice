//
//  PresentationResolver.swift
//  
//
//  Created by Maharjan Binish on 2022/02/22.
//

import Foundation
import DIKit
import Domain

// MARK: Public Interface for exporting RootViewController outside Presentation Module
public protocol RootResolver {

    func resolveRoot() -> RootViewController
}

// MARK: Internal DIKit Resolver interface for Presentation Module
public protocol PresentationResolver: Resolver, RootResolver {
    
    // MARK: For providing necessary class for ViewController
    func providePresentationResolver() -> PresentationResolver
    
    // MARK: For importing useCase to Presentation Layer
    func provideGitHubSearchUseCase() -> GitHubSearchUseCase
}

public extension PresentationResolver {
    
    func resolveRoot() -> RootViewController {
        resolveRootViewController()
    }
}

public extension PresentationResolver {
    
    func providePresentationResolver() -> PresentationResolver {
        self
    }
}
