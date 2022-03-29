//
//  DomainResolverImpl.swift
//  GitHubViewer-Storyboard
//
//  Created by Maharjan Binish on 2022/03/02.
//

import Foundation
import Domain
import Data

final class DomainResolverImpl: DomainResolver {
    
    private let repositoryResolver: RepositoryResolver
    
    init(repositoryResolver: RepositoryResolver) {
        self.repositoryResolver = repositoryResolver
    }
    
    func provideGitHubRepository() -> GitHubRepository {
        repositoryResolver.resolveGitHubRepository()
    }
}
