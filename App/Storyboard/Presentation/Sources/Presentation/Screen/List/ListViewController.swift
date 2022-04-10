//
//  ListViewController.swift
//  
//
//  Created by Maharjan Binish on 2022/03/03.
//

import UIKit
import DIKit
import RxSwift

final class ListViewController: BaseViewController<ListViewModel>, Injectable {
    
    struct Dependency {
        let viewModel: ListViewModel
        let resolver: PresentationResolver
    }
    
    private let defaultKeyword = "swift"
    private let resolver: PresentationResolver
    
    init(dependency: Dependency) {
        self.resolver = dependency.resolver
        super.init(nibName: nil, bundle: nil)
        
        self.viewModel = dependency.viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    override func loadView() {
        view = ListView(viewModel: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load with swift keyword initially
        viewModel.searchButtonClicked.onNext(defaultKeyword)
        
        bind()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}

extension ListViewController {
    
    private func bind() {
        viewModel.action
            .subscribe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] action in
                guard let self = self else { return }
                
                switch action {
                case .detail(_):
                    let viewController = self.resolver.resolveDetailViewController()
                    viewController.view.backgroundColor = .white
                    
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            })
            .disposed(by: disposeBag)
    }
}
