//
//  GitHubSearchResponse.swift
//  
//
//  Created by Maharjan Binish on 2022/02/24.
//

import Foundation
import Domain

public struct GitHubSearchEntity: Decodable {
    
    public let items: [GitHubRepositoryEntity]
    
    func toModel() -> GitHubSearchModel {
        GitHubSearchModel(items: items.map { $0.toModel() })
    }
}

public struct GitHubRepositoryEntity: Decodable {
    
    public let id: Int
    public let name: String
    public let fullName: String
    public let owner: GitHubRepositoryOwnerEntity
    public let htmlUrl: URL
    public let description: String?
    public let language: String?
    public let stargazersCount: Int
    
    func toModel() -> GitHubRepositoryModel {
        GitHubRepositoryModel(id: String(id),
                         name: name,
                         fullName: fullName,
                         owner: owner.toModel(),
                         htmlUrl: htmlUrl,
                         description: description,
                         language: language,
                         stargazersCount: String(stargazersCount))
    }
}

public struct GitHubRepositoryOwnerEntity: Decodable {
    
    public let id: Int
    public let login: String
    public let avatarUrl: URL
    
    func toModel() -> GitHubRepositoryOwnerModel {
        GitHubRepositoryOwnerModel(id: String(id), login: login, avatarUrl: avatarUrl)
    }
}
