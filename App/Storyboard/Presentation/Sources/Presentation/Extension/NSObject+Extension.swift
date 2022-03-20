//
//  NSObject+Extension.swift
//  
//
//  Created by Maharjan Binish on 2022/03/05.
//

import Foundation

extension NSObject {
    
    static var className: String {
        return String(describing: Self.self)
    }
}
