//
//  GitHubSearchUseCase.swift
//  
//
//  Created by Maharjan Binish on 2022/03/02.
//

import Foundation
import RxSwift
import DIKit

public protocol GitHubSearchUseCase {
    func execute(keyword: String) -> Single<GitHubSearchModel>
}

public final class DefaultGitHubSearchUseCase: GitHubSearchUseCase, Injectable {
    
    public struct Dependency {
        let repository: GithubRepository
    }
    
    private let repository: GithubRepository
    
    public init(dependency: Dependency) {
        self.repository = dependency.repository
    }
    
    public func execute(keyword: String) -> Single<GitHubSearchModel> {
        fatalError()
    }
}
