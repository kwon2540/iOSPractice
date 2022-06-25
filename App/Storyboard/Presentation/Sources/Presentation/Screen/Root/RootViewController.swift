//
//  RootViewController.swift
//  
//
//  Created by Maharjan Binish on 2022/03/05.
//

import UIKit
import DIKit

public final class RootViewController: SingleContainerViewContainer, Injectable {
    
    public struct Dependency {
        let resolver: PresentationResolver
    }
    
    private let resolver: PresentationResolver
    
    public init(dependency: Dependency) {
        self.resolver = dependency.resolver
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        replace(makeListViewController(), animated: false)
    }
}

extension RootViewController {
    
    func makeListViewController() -> UINavigationController {
        let viewController = resolver.resolveListViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
}
