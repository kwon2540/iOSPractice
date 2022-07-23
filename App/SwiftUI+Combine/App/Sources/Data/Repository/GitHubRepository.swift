//
//  GitHubRepository.swift
//  
//
//  Created by クォン ジュンヒョク on 2022/07/23.
//

import Foundation
import Domain

public final class GitHubRepository: GitHubRepositoryProtocol {
    
    private let apiHost = "https://api.github.com"
    
    private let apiClient: APIClientProtocol
    
    public init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }
    
    public func fetch(keyword: String) async throws -> GitHubSearchModel {
        //    func requestSomething() async  {
        //        do {
        //            self.response = try await self.service.request()
        //        } catch {
        //            // some code
        //        }
        //    }
        
        var component = URLComponents(string: self.apiHost)
        component?.path = "/search/repositories"
        
        var queryItems: [URLQueryItem]? {
            var items = [URLQueryItem]([
                .init(name: "sort", value: "stars"),
                .init(name: "order", value: "desc")
            ])

            if !keyword.isEmpty {
                let q = "\(keyword)"
                items.append(.init(name: "q", value: q))
            }

            return items
        }
        component?.queryItems = queryItems
        
        return try await apiClient.perform(method: .get, url: component?.string)
    }
}
