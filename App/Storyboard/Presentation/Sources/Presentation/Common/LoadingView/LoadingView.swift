//
//  LoadingView.swift
//  
//
//  Created by Maharjan Binish on 2022/03/05.
//

import UIKit

final class LoadingView: UIView {
    
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    init() {
        super.init(frame: .zero)
        
        loadOwnedXib()
        
        alpha = 0
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func start() {
        alpha = 1
        activityIndicator.startAnimating()
    }
    
    func stop() {
        if activityIndicator.isAnimating {
            activityIndicator.stopAnimating()
            alpha = 0
        }
    }
}
