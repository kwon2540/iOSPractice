//
//  GitHubSearchUseCase.swift
//  
//
//  Created by クォン ジュンヒョク on 2022/07/23.
//

import Foundation

public protocol GitHubSearchUseCaseProtocol {
    
    func execute(keyword: String) async throws -> GitHubSearchModel
}

public final class GitHubSearchUseCase: GitHubSearchUseCaseProtocol {
    
    private let repository: GitHubRepositoryProtocol
    
    public init(repository: GitHubRepositoryProtocol) {
        self.repository = repository
    }
    
    public func execute(keyword: String) async throws -> GitHubSearchModel {
        try await repository.fetch(keyword: keyword)
    }
}
