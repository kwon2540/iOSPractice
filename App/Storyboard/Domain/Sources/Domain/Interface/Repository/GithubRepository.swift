//
//  GithubRepository.swift
//  
//
//  Created by Maharjan Binish on 2022/02/25.
//

import Foundation
import RxSwift

public protocol GithubRepository {
    
    func fetch(keyword: String) -> Single<GitHubSearchModel>
}
