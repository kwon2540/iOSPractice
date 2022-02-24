//
//  APIRequest.swift
//  
//
//  Created by Maharjan Binish on 2022/02/24.
//

import Foundation

public protocol APIRequest {
    associatedtype Response: Decodable
    var baseURL: URL { get }
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
    var decoder: JSONDecoder { get }
}
