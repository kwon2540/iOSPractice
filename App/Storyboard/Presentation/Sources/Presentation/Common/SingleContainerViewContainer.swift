//
//  SingleContainerViewContainer.swift
//  
//
//  Created by Maharjan Binish on 2022/03/05.
//

import UIKit

public class SingleContainerViewContainer: UIViewController {
    
    private(set) var contentViewController: UIViewController?
    private let animationDuration: TimeInterval = 0.2
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
    
    func replace(_ newContentViewController: UIViewController, animated: Bool) {
        // adding child viewController
        addChild(newContentViewController)
        
        // adding child view
        let contentView: UIView = newContentViewController.view
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.frame = view.bounds
        view.addSubview(contentView)
        
        // animating the view presentation
        contentView.alpha = 0
        
        let duration: TimeInterval = animated ? animationDuration : .zero
        UIView.animate(
            withDuration: duration,
            animations: { contentView.alpha = 1 },
            completion: { _ in
                
                // if a contentViewController already exists, remove it
                if let contentViewController = self.contentViewController {
                    contentViewController.willMove(toParent: nil)
                    contentViewController.view.removeFromSuperview()
                    contentViewController.removeFromParent()
                }
                
                // move new view controller
                newContentViewController.didMove(toParent: self)
                self.contentViewController = newContentViewController
                self.setNeedsStatusBarAppearanceUpdate()
            }
        )
    }
}
