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
    
    public init(value: T) {
        self.relay = BehaviorRelay(value: value)
    }
    
    public var projectedValue: BehaviorRelay<T> {
        relay
    }
    
    public var wrappedValue: Observable<T> {
        observable
    }
}

/// BehaviorSubject<T> wrapped as Observable<T>
@propertyWrapper
public struct BehaviorSubjectWrapper<T> {
    
    private let relay: BehaviorSubject<T>
    private var observable: Observable<T> {
        relay.asObservable()
    }
    
    public init(value: T) {
        self.relay = BehaviorSubject(value: value)
    }
    
    public var projectedValue: BehaviorSubject<T> {
        relay
    }
    
    public var wrappedValue: Observable<T> {
        observable
    }
}

/// PublishSubject<T> Wrapped as Observable<T>
@propertyWrapper
public struct PublishSubjectWrapper<T> {
    
    private let subject: PublishSubject<T>
    private var observable: Observable<T> {
        subject.asObservable()
    }
    
    public init() {
        self.subject = PublishSubject<T>()
    }
    
    public var projectedValue: PublishSubject<T> {
        subject
    }
    
    public var wrappedValue: Observable<T> {
        observable
    }
}

/// AnyObserverWrapper<T> Wrapped as AnyObserver<T>
@propertyWrapper
struct AnyObserverWrapper<T> {
    
    private let relay = PublishRelay<T>()
    private let observer: AnyObserver<T>
    private let observable: Observable<T>
    
    public init() {
        observer = .create(relay)
        observable = relay.asObservable()
    }
    
    public var projectedValue: Observable<T> {
        observable
    }
    
    public var wrappedValue: AnyObserver<T> {
        observer
    }
}
