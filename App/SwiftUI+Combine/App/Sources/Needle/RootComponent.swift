//
//  RootComponent.swift
//  
//
//  Created by クォン ジュンヒョク on 2022/07/23.
//

import NeedleFoundation
import SwiftUI
import Domain
import Data
import Presentation

public final class RootComponent: BootstrapComponent {
    
    public var rootView: some View {
        RootView(listBuilder: listComponent)
    }
    
    public var apiClient: APIClientProtocol {
        APIClient()
    }
    
    public var gitHubRepository: GitHubRepositoryProtocol {
        GitHubRepository(apiClient: apiClient)
    }
    
    public var listComponent: ListComponent {
        ListComponent(parent: self)
    }
}
