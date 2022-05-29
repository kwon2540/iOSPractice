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
    
    func requestForData<Request: APIRequest>(request: Request) -> Single<Data>
}

extension APIClient {
    
    public func request<Request: APIRequest>(request: Request) -> Single<Request.Response> {
        requestForData(request: request)
            .map { try request.decoder.decode(Request.Response.self, from: $0) }
            .catch { Single.error(APIError.parseError($0)) }
    }
}

public final class DefaultAPIClient: APIClient, Injectable {
   
    public struct Dependency {}
    
    public var urlRequest: URLRequest!
    
    public init(dependency: Dependency) {}
    
    public func requestForData<Request>(request: Request) -> Single<Data> where Request : APIRequest {
        guard let urlRequest = request.urlRequest else {
            return Single.error(APIError.invalidURL)
        }
        
        return Single.create(subscribe: { single -> Disposable in
            
            let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                if error != nil  {
                    single(.failure(APIError.responseError))
                    return
                }
                
                guard let data = data else {
                    single(.failure(APIError.responseError))
                    return
                }
                
                return single(.success(data))
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
