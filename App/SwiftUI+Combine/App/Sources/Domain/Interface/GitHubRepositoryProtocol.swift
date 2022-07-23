//
//  GitHubRepositoryProtocol.swift
//  
//
//  Created by クォン ジュンヒョク on 2022/07/16.
//

import Foundation

public protocol GitHubRepositoryProtocol {
    
    func fetch(keyword: String) async throws -> GitHubSearchModel
}
