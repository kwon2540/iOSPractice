//
//  GitHubViewer_SwiftUI_CombineApp.swift
//  GitHubViewer-SwiftUI+Combine
//
//  Created by クォン ジュンヒョク on 2022/07/02.
//

import SwiftUI
import Presentation
import NeedleFoundation
import Needle

@main
struct GitHubViewer_SwiftUI_CombineApp: App {
    
    init() {
        registerProviderFactories()
    }
    
    var body: some Scene {
        WindowGroup {
            RootComponent().rootView
        }
    }
}
