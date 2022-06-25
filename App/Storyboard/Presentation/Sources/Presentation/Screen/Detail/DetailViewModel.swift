//
//  DetailViewModel.swift
//  
//
//  Created by Maharjan Binish on 2022/03/03.
//

import Foundation
import DIKit
import RxSwift

// MARK: Inputs
protocol DetailViewModelInputs {}

// MARK: Outputs
protocol DetailViewModelOutputs {
    var url: Observable<URL> { get }
}

typealias DetailViewModelType = DetailViewModelInputs & DetailViewModelOutputs

class DetailViewModel: BaseViewModel, Injectable {

    public struct Dependency {
        let url: URL
        let title: String
    }
    
    // MARK: Outputs
    @BehaviorSubjectAsObservable(value: nil)
    var url: Observable<URL?>
    
    @BehaviorSubjectAsObservable(value: "aaa")
    var title: Observable<String>
    
    required public init(dependency: Dependency) {
        super.init()
        
        bind(dependency: dependency)
    }
}

extension DetailViewModel {
    
    private func bind(dependency: Dependency) {
        $url.onNext(dependency.url)
        $title.onNext(dependency.title)
    }
}
