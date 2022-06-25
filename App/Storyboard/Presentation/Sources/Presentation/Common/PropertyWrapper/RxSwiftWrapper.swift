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
public struct BehaviorRelayAsObservable<T> {
    
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
public struct BehaviorSubjectAsObservable<T> {
    
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

/// PublishRelay<T> Wrapped as Observable<T>
@propertyWrapper
public struct PublishRelayAsObservable<T> {
    
    private let relay: PublishRelay<T>
    private var observable: Observable<T> {
        relay.asObservable()
    }
    
    public init() {
        self.relay = PublishRelay()
    }
    
    public var projectedValue: PublishRelay<T> {
        relay
    }
    
    public var wrappedValue: Observable<T> {
        observable
    }
}

/// PublishSubject<T> Wrapped as Observable<T>
@propertyWrapper
public struct PublishSubjectAsObservable<T> {
    
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

/// PublishSubject<T> Wrapped as AnyObserver<T>
@propertyWrapper
public struct PublishSubjectAsObserver<T> {
    
    private let subject: PublishSubject<T>
    private var observer: AnyObserver<T> {
        subject.asObserver()
    }
    
    public init() {
        subject = PublishSubject<T>()
    }
    
    public var projectedValue: PublishSubject<T> {
        subject
    }
    
    public var wrappedValue: AnyObserver<T> {
        observer
    }
}
