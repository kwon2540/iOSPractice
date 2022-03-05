//
//  BaseViewController.swift
//  
//
//  Created by Maharjan Binish on 2022/03/03.
//

import UIKit
import RxSwift

public class BaseViewController<T: BaseViewModelType>: UIViewController {
    
    private let disposeBag = DisposeBag()
    var viewModel: T!
  
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

// MARK: Bind
extension BaseViewController {
    
    private func bindBaseViewModel() {
        viewModel.loadingState
            .subscribe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] loadingState in
                
                switch loadingState {
                case .initial, .completed:
                    break
                case .loading:
                    break
                }
            })
            .disposed(by: disposeBag)
    }
}
