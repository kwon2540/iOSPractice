//
//  RxSwiftWrapper.swift
//  
//
//  Created by Maharjan Binish on 2022/03/11.
//

import Foundation
import RxSwift
import RxCocoa

/// BehaviorRelay<T> wrapped as Observable<T>
@propertyWrapper
public struct BehaviorRelayWrapper<T> {
    
    private let relay: BehaviorRelay<T>
    private var observable: Observable<T> {
        relay.asObservable()
    }
    
    init(value: T) {
        self.relay = BehaviorRelay(value: value)
    }
    
    public var projectedValue: BehaviorRelay<T> {
        relay
    }
    
    public var wrappedValue: Observable<T> {
        observable
    }
}


