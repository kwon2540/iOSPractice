//
//  DetailView.swift
//  
//
//  Created by Maharjan Binish on 2022/06/25.
//

import UIKit
import WebKit
import RxSwift

final class DetailView: UIView {
    
    @IBOutlet private weak var progressView: UIProgressView!
    @IBOutlet private weak var webView: WKWebView!
    
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
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
        }
    }
}

extension DetailView {
    
    private func bind() {
        viewModel.url
            .skipNil()
            .observe(on: MainScheduler.instance)
            .bind(to: webView.rx.loadUrl)
            .disposed(by: disposeBag)
    }
}
