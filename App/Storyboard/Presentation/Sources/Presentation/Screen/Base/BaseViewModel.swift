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
}

// MARK: Inputs & Outputs
typealias BaseViewModelType = BaseViewModelInputs & BaseViewModelOutputs

// MARK: Concrete Implementation
class BaseViewModel: BaseViewModelType {
    // MARK: Outputs
    @PublishSubjectWrapper<LoadingState>
    var loadingState: Observable<LoadingState>
    
    func showLoading() {
        $loadingState.accept(.loading)
    }
    
    func hideLoading() {
        $loadingState.accept(.completed)
    }
}
