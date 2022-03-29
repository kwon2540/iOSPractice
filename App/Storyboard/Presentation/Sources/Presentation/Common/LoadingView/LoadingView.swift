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
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            self.alpha = 1
            self.activityIndicator.startAnimating()
        }
    }
    
    func stop() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            if self.activityIndicator.isAnimating {
                self.activityIndicator.stopAnimating()
                self.alpha = 0
            }
        }
    }
}
