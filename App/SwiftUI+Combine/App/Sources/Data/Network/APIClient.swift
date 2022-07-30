//
//  APIClient.swift
//  
//
//  Created by クォン ジュンヒョク on 2022/07/16.
//

import Foundation

public enum APIError: Error {
    case invalidURL
    case responseError
    case parseError(Error)
}

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

public protocol APIClientProtocol {
    
    func perform<T: Decodable>(method: HTTPMethod, url: String?) async throws -> T
}

public class APIClient: APIClientProtocol {
    
    public init() {}

    public func perform<T: Decodable>(method: HTTPMethod, url: String?) async throws -> T {
        guard let urlString = url, let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        let (data, _) = try await URLSession.shared.data(for: request)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(T.self, from: data)
    }
}
