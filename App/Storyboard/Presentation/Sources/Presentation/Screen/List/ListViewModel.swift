//
//  ListViewModel.swift
//  
//
//  Created by Maharjan Binish on 2022/03/03.
//

import Foundation
import Domain
import DIKit
import RxSwift
import RxCocoa

// MARK: Inputs
protocol ListViewModelInputs {
    
    var didEnterSearchKeyword: AnyObserver<String> { get }
}

// MARK: Outputs
protocol ListViewModelOutputs {
    
    var repositories: Observable<[GitHubRepositoryModel]> { get }
}

typealias ListViewModelType = ListViewModelInputs & ListViewModelOutputs

class ListViewModel: BaseViewModel, ListViewModelType, Injectable {
    
    struct Dependency {
        let searchUseCase: GitHubSearchUseCase
    }
    
    // MARK: Inputs
    @AnyObserverWrapper<String>
    var didEnterSearchKeyword: AnyObserver<String> {
    
    // MARK: Outputs
    @BehaviorRelayWrapper<[GitHubRepositoryModel]>(value: [])
    var repositories: Observable<[GitHubRepositoryModel]>
    
    
    
    // MARK: Properties
    private let searchUseCase: GitHubSearchUseCase
    
    required public init(dependency: Dependency) {
        self.searchUseCase = dependency.searchUseCase
        super.init()
    }
    
    func fetchRepositoryList(for keyword: String) {
        $loadingState.onNext(.loading)
        
        searchUseCase.execute(keyword: keyword)
            .subscribe(on: MainScheduler.instance)
            .subscribe { [weak self] searchModel in
                guard let self = self else { return }
                
                self.$repositories.accept(searchModel.items)
                self.$loadingState.onNext(.completed)
            } onFailure: { [weak self] error in
                guard let self = self else { return }
                
                self.$showError.onNext(error)
                self.$loadingState.onNext(.completed)
            }
            .disposed(by: disposeBag)
    }
}
