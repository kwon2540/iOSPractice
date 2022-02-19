//
//  NSObject+Extension.swift
//  GithubViewer-Storyboard
//
//  Created by Maharjan Binish on 2022/02/19.
//

import Foundation
import UIKit

// MARK: NSObject
extension NSObject {
    
    static var className: String {
        return String(describing: Self.self)
    }
}

// MARK: Xib
extension UIView {
    /// Load xib which self is file owner
    func loadOwnedXib(xibName: String? = nil) {
        let v = UINib(nibName: xibName ?? Self.className, bundle: nil).instantiate(withOwner: self, options: nil).first as! UIView
        v.frame = bounds
        addSubview(v)
        v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
