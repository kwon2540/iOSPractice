//
//  DefaultGithubRepository.swift
//  
//
//  Created by Maharjan Binish on 2022/02/25.
//

import Foundation
import Domain
import RxSwift

public final class DefaultGithubRepository: GithubRepository {
    
    public func fetch(keyword: String) -> Single<GitHubSearchModel> {
        GitHubSearchAPIRequest(keyword: keyword)
            .request()
            .map { $0.toModel() }
    }
}
