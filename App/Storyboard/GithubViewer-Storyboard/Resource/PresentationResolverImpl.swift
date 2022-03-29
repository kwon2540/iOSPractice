//
//  PresentationResolverImpl.swift
//  GitHubViewer-Storyboard
//
//  Created by Maharjan Binish on 2022/03/20.
//

import Foundation
import Presentation
import Domain

final class PresentationResolverImpl: PresentationResolver {
    
    private let domainResolver: DomainResolver
    
    init(domainResolver: DomainResolver) {
        self.domainResolver = domainResolver
    }
    
    func provideGitHubSearchUseCase() -> GitHubSearchUseCase {
        domainResolver.resolveGitHubSearchUseCase()
    }
}
