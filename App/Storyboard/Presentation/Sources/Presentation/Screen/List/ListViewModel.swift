//
//  ListViewModel.swift
//  
//
//  Created by Maharjan Binish on 2022/03/03.
//

import Foundation
import Domain
import DIKit

public class ListViewModel: BaseViewModel, Injectable {
    
    public struct Dependency {
        let searchUseCase: GitHubSearchUseCase
    }
    
    private let searchUseCase: GitHubSearchUseCase
    
    required public init(dependency: Dependency) {
        self.searchUseCase = dependency.searchUseCase
    }
    
    func crash() {
        searchUseCase.execute(keyword: "")
    }
}
