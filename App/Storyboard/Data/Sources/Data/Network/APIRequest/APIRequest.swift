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

extension APIRequest {
    
    public var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
    
    var urlRequest: URLRequest? {
        guard let url = URL(string: path, relativeTo: baseURL),
              var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
                  return nil
              }
        
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        return request
    }
}
