//
//  GitHubRepositoryTests.swift
//  
//
//  Created by クォン ジュンヒョク on 2022/07/16.
//

import XCTest
@testable import Data

final class GitHubRepositoryTests: XCTestCase {
    
    func testSearch_callsSearchAPIWithParameters() {
        // given
        let apiClient = APIClientStub()
        let repository = GitHubRepository(apiClient: apiClient)
        let keyword = "swift"
        
        Task {
            // when
            let _ = try await repository.fetch(keyword: keyword)
            
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
}

final class APIClientStub: APIClientProtocol {
    
    var urlRequest: URLRequest!
    
    func perform(method: HTTPMethod, url: String?) async throws -> Data {
        urlRequest = URLRequest(url: URL(string: url!)!)
        urlRequest.httpMethod = method.rawValue
        
        return Data()
    }
}
