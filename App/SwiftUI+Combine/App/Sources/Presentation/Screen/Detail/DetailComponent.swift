//
//  DetailComponent.swift
//  
//
//  Created by クォン ジュンヒョク on 2022/07/30.
//

import Foundation
import NeedleFoundation

public protocol DetailDependency: Dependency {}

public protocol DetailBuilder {
    func detailView(url: URL, title: String) -> DetailView
}

public class DetailComponent: Component<DetailDependency>, DetailBuilder {
    
    public func detailView(url: URL, title: String) -> DetailView {
        DetailView(url: url, title: title)
    }
}
