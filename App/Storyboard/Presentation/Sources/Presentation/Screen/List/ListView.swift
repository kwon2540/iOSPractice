//
//  ListView.swift
//  
//
//  Created by Maharjan Binish on 2022/03/05.
//

import UIKit

final class ListView: UIView {
    
    private let viewModel: ListViewModel
    
    @IBAction func buttonPressed(_ sender: Any) {
        
        viewModel.showLoading()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.viewModel.hideLoading()
        }
    }
    
    init(viewModel: ListViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        loadOwnedXib()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
