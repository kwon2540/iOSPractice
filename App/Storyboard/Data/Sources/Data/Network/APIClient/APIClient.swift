//
//  APIClient.swift
//  
//
//  Created by Maharjan Binish on 2022/02/24.
//

import Foundation
import RxSwift
import DIKit

// Write Test Code for SessionManager.request
public protocol APIClient {
    
    var urlRequest: URLRequest! { get }
    
    func request<Request: APIRequest>(request: Request) -> Single<Request.Response>
}

public final class DefaultAPIClient: APIClient, Injectable {
   
    public struct Dependency {}
    
    public var urlRequest: URLRequest!
    
    public init(dependency: Dependency) {}
    
    public func request<Request>(request: Request) -> Single<Request.Response> where Request : APIRequest {
        guard let urlRequest = request.urlRequest else {
            return Single.error(APIError.invalidURL)
        }
        
        self.urlRequest = urlRequest
        
        return Single.create(subscribe: { [weak self] single -> Disposable in
            
            let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                guard let self = self else {
                    single(.failure(APIError.responseError))
                    return
                }
                
                if error != nil  {
                    single(.failure(APIError.responseError))
                    return
                }
                
                guard let data = data else {
                    single(.failure(APIError.responseError))
                    return
                }
                
                do {
                    let response = try request.decoder.decode(Request.Response.self, from: data)
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

public enum APIError: Error {
    case invalidURL
    case responseError
    case parseError(Error)
}
