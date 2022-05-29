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
        // given
        let apiClient = APIClientStub()
        let repository = DefaultGitHubRepository(dependency: .init(apiClient: apiClient))
        let keyword = "swift"
        
        // when
        repository.fetch(keyword: keyword)
            .subscribe(onSuccess: { _ in })
            .dispose()
        
        // then
        let expectedHost = "api.github.com"
        let actualHost = apiClient.urlRequest.url?.host
        XCTAssertEqual(expectedHost, actualHost)
        
        let expectedPath = "/search/repositories"
        let actualPath = apiClient.urlRequest.url?.path
        XCTAssertEqual(expectedPath, actualPath)

        let expectedMethod = "GET"
        let actualMethod = apiClient.urlRequest.httpMethod
        XCTAssertEqual(expectedMethod, actualMethod)
        
        let components = URLComponents(url: apiClient.urlRequest.url!, resolvingAgainstBaseURL: false)
        let query = components?.queryItems?.first(where: { $0.name == "q" })
        let expectedQueryValue = keyword
        let actualQueryValue = query?.value
        XCTAssertEqual(expectedQueryValue, actualQueryValue)
    }
}

final class APIClientStub: APIClient {

    var urlRequest: URLRequest!
    
    func requestForData<Request>(request: Request) -> Single<Data> where Request : APIRequest {
        urlRequest = request.urlRequest
        
        return Single.create { single in
            single(.success(Data()))
            return Disposables.create()
        }
    }
}
