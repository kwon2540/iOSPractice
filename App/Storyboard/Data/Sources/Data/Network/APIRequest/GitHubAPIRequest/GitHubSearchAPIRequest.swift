//
//  GitHubSearchAPIRequest.swift
//  
//
//  Created by Maharjan Binish on 2022/02/24.
//

import Foundation

/// GitHub Search API Request
/// Sample URL: https://api.github.com/search/repositories\?q=topic:ios+language:swift+stars:\>\=1000\&sort\=stars\&order\=desc
public struct GitHubSearchAPIRequest: GitHubAPIRequest {
    public typealias Response = GitHubSearchEntity

    public var path: String = "/search/repositories"

    public var queryItems: [URLQueryItem]? {
        var items = [URLQueryItem]([
            .init(name: "sort", value: "stars"),
            .init(name: "order", value: "desc")
        ])

        if let keyword = keyword, !keyword.isEmpty {
            let q = "\(keyword)"
            items.append(.init(name: "q", value: q))
        }

        return items
    }

    let keyword: String?

    public init(keyword: String? = nil) {
        self.keyword = keyword ?? ""
    }
}
