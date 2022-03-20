//
//  BaseViewController.swift
//  
//
//  Created by Maharjan Binish on 2022/03/03.
//

import UIKit
import RxSwift

public class BaseViewController<T: BaseViewModelType>: UIViewController {
    
    private let loadingView = LoadingView()
    private let disposeBag = DisposeBag()
    
    var viewModel: T!
  
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        bindBaseViewModel()
    }
}

// MARK: Bind
extension BaseViewController {
    
    private func bindBaseViewModel() {
        viewModel.loadingState
            .subscribe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] loadingState in
                
                guard let self = self else { return }
                
                switch loadingState {
                case .initial:
                    self.view.addSubviewWithFullFilling(subview: self.loadingView)
                    
                case .loading:
                    self.loadingView.start()
                    
                case .completed:
                    self.loadingView.stop()
                }
            })
            .disposed(by: disposeBag)
    }
}
