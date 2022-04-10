//
//  DetailView.swift
//  
//
//  Created by Maharjan Binish on 2022/04/10.
//

import UIKit
import RxSwift

final class DetailView: UIView {
    
    private let viewModel: DetailViewModel
    private let disposeBag = DisposeBag()
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        loadOwnedXib()
        
        setup()
        
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailView {
    
    private func setup() {
        
    }
}

extension DetailView {
    
    private func bind() {
        
    }
}
