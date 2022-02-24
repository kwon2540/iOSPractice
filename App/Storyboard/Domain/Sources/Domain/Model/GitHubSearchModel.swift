//
//  GitHubSearch.swift
//  
//
//  Created by Maharjan Binish on 2022/02/24.
//

import Foundation

public struct GitHubSearchModel: Decodable {
    
    public let items: [GitHubRepositoryModel]
    
    public init(items: [GitHubRepositoryModel]) {
        self.items = items
    }
}

public struct GitHubRepositoryModel: Decodable {
    
    public let id: String
    public let name: String
    public let fullName: String
    public let owner: GitHubRepositoryOwnerModel
    public let htmlUrl: URL
    public let description: String?
    public let language: String?
    public let stargazersCount: String
    
    public init(id: String, name: String, fullName: String, owner: GitHubRepositoryOwnerModel, htmlUrl: URL, description: String?, language: String?, stargazersCount: String) {
        self.id = id
        self.name = name
        self.fullName = fullName
        self.owner = owner
        self.htmlUrl = htmlUrl
        self.description = description
        self.language = language
        self.stargazersCount = stargazersCount
    }
}

public struct GitHubRepositoryOwnerModel: Decodable {
    
    public let id: String
    public let login: String
    public let avatarUrl: URL
    
    public init(id: String, login: String, avatarUrl: URL) {
        self.id = id
        self.login = login
        self.avatarUrl = avatarUrl
    }
}
