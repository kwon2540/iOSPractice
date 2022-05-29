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
    
    public struct Dependency {
        var apiClient: APIClient
    }
    
    private var apiClient: APIClient
    
    public init(dependency: Dependency) {
        self.apiClient = dependency.apiClient
    }
    
    public func fetch(keyword: String) -> Single<GitHubSearchModel> {
        apiClient
            .request(request: GitHubSearchAPIRequest(keyword: keyword))
            .map { $0.toModel() }
    }
}
