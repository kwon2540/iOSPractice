//
//  BaseViewModel.swift
//  
//
//  Created by Maharjan Binish on 2022/03/03.
//

import Foundation
import RxCocoa
import RxSwift

// MARK: Inputs
protocol BaseViewModelInputs {
    
}

// MARK: Outputs
protocol BaseViewModelOutputs {
    
    var loadingState: Observable<LoadingState> { get }
    
    var showError: Observable<Error> { get }
}

// MARK: Inputs & Outputs
typealias BaseViewModelType = BaseViewModelInputs & BaseViewModelOutputs

// MARK: Concrete Implementation
class BaseViewModel: BaseViewModelType {
    // MARK: Outputs
    @PublishSubjectAsObservable<LoadingState>
    var loadingState: Observable<LoadingState>
    
    @PublishSubjectAsObservable<Error>
    var showError: Observable<Error>
    
    // MARK: Properties
    public let disposeBag = DisposeBag()
}
