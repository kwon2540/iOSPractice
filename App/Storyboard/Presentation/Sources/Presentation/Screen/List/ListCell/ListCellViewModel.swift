//
//  ListCellViewModel.swift
//  
//
//  Created by Maharjan Binish on 2022/04/08.
//

import UIKit
import Domain
import RxSwift

// MARK: Inputs
protocol ListCellViewModelInputs { }

// MARK: Outputs
protocol ListCellViewModelOutputs {
    
    var name: Observable<String> { get }
    var owner: Observable<String> { get }
    var description: Observable<String?> { get }
    var language: Observable<String?> { get }
}

typealias ListCellViewModelType = ListCellViewModelInputs & ListCellViewModelOutputs

final class ListCellViewModel: ListCellViewModelType {
    
    // MARK: Outputs
    let name: Observable<String>
    let owner: Observable<String>
    let description: Observable<String?>
    let language: Observable<String?>
    
    // MARK: Properties
    private let repository: GitHubRepositoryModel
    
    init(repository: GitHubRepositoryModel) {
        self.repository = repository
        
        name = Observable.just(repository.name)
        owner = Observable.just(repository.owner.login)
        description = Observable.just(repository.description)
        language = Observable.just(repository.language)
    }
}
