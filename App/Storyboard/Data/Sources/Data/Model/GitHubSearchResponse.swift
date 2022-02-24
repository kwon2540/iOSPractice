//
//  GitHubSearchResponse.swift
//  
//
//  Created by Maharjan Binish on 2022/02/24.
//

import Foundation

public struct GitHubSearchResponse: Decodable {
    public let items: [GitHubRepository]
}

public struct GitHubRepository: Decodable {
    public let id: Int
    public let name: String
    public let fullName: String
    public let owner: GitHubRepositoryOwner
    public let htmlUrl: URL
    public let description: String?
    public let language: String?
    public let stargazersCount: Int
}

public struct GitHubRepositoryOwner: Decodable {
    public let id: Int
    public let login: String
    public let avatarUrl: URL
}
