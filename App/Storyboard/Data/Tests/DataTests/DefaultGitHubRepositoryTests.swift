//
//  DefaultGitHubRepositoryTests.swift
//  
//
//  Created by Maharjan Binish on 2022/05/29.
//

import XCTest
import RxSwift
@testable import Data

final class DefaultGitHubRepositoryTests: XCTestCase {
    
    func testSearch_callsSearchAPIWithParameters() {
        
        let apiClient = DefaultAPIClient(dependency: .init())
        
    }
}


final class APIClientStub: APIClient {
    func request<Request>(request: Request) -> Single<Request.Response> where Request : APIRequest {
        fatalError()
    }
    
    var urlRequest: URLRequest!
    
    func request<GitHubSearchAPIRequest>(request: GitHubSearchAPIRequest) -> Single<GitHubSearchEntity> {
        return Single<GitHubSearchEntity>.create { single in
            single(.success(GitHubSearchEntity.dummy))
            
            return Disposables.create()
        }
    }
}

extension GitHubSearchEntity {
    
    static var dummy: GitHubSearchEntity {
        GitHubSearchEntity(items: [])
    }
}


//
//
//@testable import Alamofire
//@testable import LetsGitHubSearch
//
//final class SessionManagerStub: SessionManagerProtocol {
//  var requestParameters: (url: URLConvertible, method: HTTPMethod, parameters: Parameters?)?
//
//  func request(_ url: URLConvertible, method: HTTPMethod, parameters: Parameters?, encoding: ParameterEncoding, headers: HTTPHeaders?) -> DataRequest {
//    self.requestParameters = (url, method, parameters)
//    return DataRequest(session: URLSession(), requestTask: .data(nil, nil))
//  }
//}
