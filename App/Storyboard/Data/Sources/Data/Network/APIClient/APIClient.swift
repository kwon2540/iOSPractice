//
//  APIClient.swift
//  
//
//  Created by Maharjan Binish on 2022/02/24.
//

import Foundation
import RxSwift

public enum APIError: Error {
    case invalidURL
    case responseError
    case parseError(Error)
}

public extension APIRequest {
    
    /// Default Decoder
    var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
    
    /// API Request
    func request() -> Single<Response> {
        guard let url = URL(string: path, relativeTo: baseURL),
              var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
                  return Single.error(APIError.invalidURL)
              }
        
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else {
            return Single.error(APIError.invalidURL)
        }
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        
        return Single.create(subscribe: { single -> Disposable in
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                
                if error != nil  {
                    single(.failure(APIError.responseError))
                    return
                }
                
                guard let data = data else {
                    single(.failure(APIError.responseError))
                    return
                }
                
                do {
                    let response = try decoder.decode(Response.self, from: data)
                    single(.success(response))
                } catch {
                    single(.failure(APIError.parseError(error)))
                }
            }
            
            task.resume()
            
            return Disposables.create()
        })
            .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .background))
    }
}
