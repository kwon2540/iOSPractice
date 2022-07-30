

import Data
import Domain
import Foundation
import NeedleFoundation
import Presentation
import SwiftUI

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Registration

public func registerProviderFactories() {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent") { component in
        return EmptyDependencyProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->ListComponent->DetailComponent") { component in
        return DetailDependency4cb3ca5e18c8c889af8eProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->ListComponent") { component in
        return ListDependency9c2f5b85fb6808210ea1Provider(component: component)
    }
    
}

// MARK: - Providers

private class DetailDependency4cb3ca5e18c8c889af8eBaseProvider: DetailDependency {


    init() {

    }
}
/// ^->RootComponent->ListComponent->DetailComponent
private class DetailDependency4cb3ca5e18c8c889af8eProvider: DetailDependency4cb3ca5e18c8c889af8eBaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init()
    }
}
private class ListDependency9c2f5b85fb6808210ea1BaseProvider: ListDependency {
    var gitHubRepository: GitHubRepositoryProtocol {
        return rootComponent.gitHubRepository
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->ListComponent
private class ListDependency9c2f5b85fb6808210ea1Provider: ListDependency9c2f5b85fb6808210ea1BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(rootComponent: component.parent as! RootComponent)
    }
}
