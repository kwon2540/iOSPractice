//
//  Resolver.swift
//  Generated by dikitgen.
//

import DIKit
import Foundation
import RxSwift

extension DomainResolver {

    func resolveDefaultGitHubSearchUseCase() -> DefaultGitHubSearchUseCase {
        let gitHubRepository = resolveGitHubRepository()
        return DefaultGitHubSearchUseCase(dependency: .init(repository: gitHubRepository))
    }

    func resolveGitHubRepository() -> GitHubRepository {
        return provideGitHubRepository()
    }

}

