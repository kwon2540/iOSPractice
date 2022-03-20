//
//  UIView+Extension.swift
//  
//
//  Created by Maharjan Binish on 2022/03/05.
//

import UIKit

extension UIView {
    
    /// Load xib which self is file owner
    func loadOwnedXib() {
        let v = UINib(nibName: Self.className, bundle: Bundle.module).instantiate(withOwner: self, options: nil).first as! UIView
        v.frame = bounds
        addSubview(v)
        v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}


extension UIView {
    
    /// Subviewを全体に広げて追加
    func addSubviewWithFullFilling(subview: UIView) {
        addSubview(subview)

        subview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subview.topAnchor.constraint(equalTo: topAnchor),
            subview.bottomAnchor.constraint(equalTo: bottomAnchor),
            subview.leadingAnchor.constraint(equalTo: leadingAnchor),
            subview.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
