//
//  DataLayer.swift
//  DataLayer
//
//  Created by Maharjan Binish on 2022/01/31.
//

import Foundation
import RxSwift
import DomainLayer

public final class DataLayer {

    public static var shared = DataLayer()
    
    private init() { }
    
    public func testRun() {
        print("DataLayer: OK...")
    }
}
