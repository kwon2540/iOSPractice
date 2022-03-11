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
public protocol BaseViewModelInputs {
    
}

// MARK: Outputs
public protocol BaseViewModelOutputs {
    
    var loadingState: Observable<LoadingState> { get }
}

// MARK: Inputs & Outputs
public typealias BaseViewModelType = BaseViewModelInputs & BaseViewModelOutputs

// MARK: Concrete Implementation
public class BaseViewModel: BaseViewModelType {
    
    @BehaviorRelayWrapper<LoadingState>(value: .initial)
    public var loadingState: Observable<LoadingState>
    
    func showLoading() {
        $loadingState.accept(.loading)
    }
    
    func hideLoading() {
        $loadingState.accept(.completed)
    }
}
