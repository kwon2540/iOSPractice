//
//  DetailViewController.swift
//  
//
//  Created by Maharjan Binish on 2022/03/03.
//

import Foundation
import DIKit

final class DetailViewController: BaseViewController<DetailViewModel>, Injectable {
    
    public struct Dependency {
        let viewModel: DetailViewModel
    }
    
    public init(dependency: Dependency) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = dependency.viewModel
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
}


