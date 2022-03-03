//
//  DomainResolver.swift
//  
//
//  Created by Maharjan Binish on 2022/02/22.
//

import Foundation
import DIKit

public protocol DomainResolver: Resolver {
    func provideGithubRepository() -> GithubRepository
   
}

public final class DomainResolverImpl: DomainResolver {
    
    public init() { }
    
    public func provideDomainModel() -> DomainModel {
        return DomainModel(string: "Hello Domain!")
    }
}
