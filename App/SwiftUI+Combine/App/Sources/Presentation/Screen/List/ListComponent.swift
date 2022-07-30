//
//  ListComponent.swift
//  
//
//  Created by クォン ジュンヒョク on 2022/07/30.
//

import Foundation
import NeedleFoundation
import Domain

public protocol ListDependency: Dependency {
    var gitHubRepository: GitHubRepositoryProtocol { get }
}

public protocol ListBuilder {
    var listView: ListView { get }
}

public class ListComponent: Component<ListDependency>, ListBuilder {
     
    public var listView: ListView {
        ListView(gitHubSearchUseCase: gitHubSearchUseCase, detailBuilder: detailComponent)
    }
    
    public var gitHubSearchUseCase: GitHubSearchUseCaseProtocol {
        GitHubSearchUseCase(repository: dependency.gitHubRepository)
    }
    
    public var detailComponent: DetailComponent {
        DetailComponent(parent: self)
    }
}
