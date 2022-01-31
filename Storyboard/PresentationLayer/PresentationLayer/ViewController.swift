//
//  ViewController.swift
//  PresentationLayer
//
//  Created by Maharjan Binish on 2022/01/31.
//

import UIKit
import DomainLayer
import DataLayer

class ViewController: UIViewController {
    
    private let domainLayer = DomainLayer.shared
    private let dataLayer = DataLayer.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        
        domainLayer.testRun()
        dataLayer.testRun()
        
    }
}

