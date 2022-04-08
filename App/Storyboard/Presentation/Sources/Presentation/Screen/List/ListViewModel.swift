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
    
    var searchButtonClicked: AnyObserver<String?> { get }
}

// MARK: Outputs
protocol ListViewModelOutputs {
    
    var repositories: Observable<[GitHubRepositoryModel]> { get }
}

typealias ListViewModelType = ListViewModelInputs & ListViewModelOutputs

final class ListViewModel: BaseViewModel, ListViewModelType, Injectable {
    
    struct Dependency {
        let searchUseCase: GitHubSearchUseCase
    }
    
    // MARK: Inputs
    @PublishSubjectAsObserver<String?>
    var searchButtonClicked: AnyObserver<String?>
    
    // MARK: Outputs
    @BehaviorRelayAsObservable<[GitHubRepositoryModel]>(value: [])
    var repositories: Observable<[GitHubRepositoryModel]>
    
    // MARK: Properties
    private let searchUseCase: GitHubSearchUseCase
    
    required public init(dependency: Dependency) {
        self.searchUseCase = dependency.searchUseCase
        super.init()
        
        bind()
    }
    
    private func fetchRepositoryList(for keyword: String) {
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

extension ListViewModel {
    
    private func bind() {
        $searchButtonClicked
            .skipNil()
            .subscribe(onNext: { [weak self] keyword in
                guard let self = self else { return }
                
                self.fetchRepositoryList(for: keyword)
            })
            .disposed(by: disposeBag)
    }
}
