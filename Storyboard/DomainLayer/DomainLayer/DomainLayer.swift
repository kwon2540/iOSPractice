//
//  DomainLayer.swift
//  DomainLayer
//
//  Created by Maharjan Binish on 2022/01/31.
//

import Foundation
import RxSwift

public final class DomainLayer {

    public static var shared = DomainLayer()
    
    private init() { }
    
    public func testRun() {
        print("DomainLayer: OK...")
    }
}
