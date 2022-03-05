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
    
    private let _loadingState = BehaviorRelay<LoadingState>(value: .initial)
    public var loadingState: Observable<LoadingState> {
        _loadingState.asObservable()
    }
    
}
