//
//  DefaultGitHubRepository.swift
//  
//
//  Created by Maharjan Binish on 2022/02/25.
//

import Foundation
import Domain
import RxSwift
import DIKit

public final class DefaultGitHubRepository: GitHubRepository, Injectable {
    
    public struct Dependency {}
    
    public init(dependency: Dependency) { }
    
    public func fetch(keyword: String) -> Single<GitHubSearchModel> {
        GitHubSearchAPIRequest(keyword: keyword)
            .request()
            .map { $0.toModel() }
    }
}
