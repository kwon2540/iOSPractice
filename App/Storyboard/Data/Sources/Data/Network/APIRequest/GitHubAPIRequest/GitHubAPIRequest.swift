//
//  GitHubAPIRequest.swift
//  
//
//  Created by Maharjan Binish on 2022/02/24.
//

import Foundation

public protocol GitHubAPIRequest: APIRequest {}

public extension GitHubAPIRequest {
    var baseURL: URL { URL(string: "https://api.github.com")! }
}
