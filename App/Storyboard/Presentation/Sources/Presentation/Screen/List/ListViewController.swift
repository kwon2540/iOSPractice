//
//  ListViewController.swift
//  
//
//  Created by Maharjan Binish on 2022/03/03.
//

import UIKit
import DIKit

final class ListViewController: BaseViewController<ListViewModel>, Injectable {
    
    public struct Dependency {
        let viewModel: ListViewModel
    }
    
    private let defaultKeyword = "swift"
    
    public init(dependency: Dependency) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = dependency.viewModel
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    public override func loadView() {
        view = ListView(viewModel: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load with swift keyword initially
        viewModel.searchButtonClicked.onNext(defaultKeyword)
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}

