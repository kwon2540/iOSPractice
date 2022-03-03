//
//  BaseViewController.swift
//  
//
//  Created by Maharjan Binish on 2022/03/03.
//

import UIKit

public class BaseViewController<T: BaseViewModel>: UIViewController {
    
    var viewModel: T!
  
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
}
