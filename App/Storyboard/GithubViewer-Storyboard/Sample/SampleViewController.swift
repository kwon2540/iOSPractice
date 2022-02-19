//
//  SampleViewController.swift
//  GithubViewer-Storyboard
//
//  Created by Maharjan Binish on 2022/02/19.
//

import Foundation
import UIKit
import DIKit

class SampleViewController: UIViewController, Injectable {
    
    struct Dependency {
        let viewModel: SampleViewModel
    }
    
    let viewModel: SampleViewModel
    
    required init(dependency: Dependency) {
        self.viewModel = dependency.viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func loadView() {
        self.view = SampleView(model: viewModel.model)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


