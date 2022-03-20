//
//  DomainResolver.swift
//  
//
//  Created by Maharjan Binish on 2022/02/22.
//

import Foundation
import DIKit

public protocol DomainResolver: Resolver {
    
    func provideGithubRepository() -> GithubRepository
}

public extension DomainResolver {
    
    func resolveGithubSearchUseCase() -> GitHubSearchUseCase {
        resolveDefaultGitHubSearchUseCase()
    }
}
