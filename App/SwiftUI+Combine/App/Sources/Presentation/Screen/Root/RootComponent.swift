//
//  RootComponent.swift
//  
//
//  Created by クォン ジュンヒョク on 2022/07/23.
//

import NeedleFoundation
import SwiftUI

public final class RootComponent: BootstrapComponent {
    
    public var rootView: some View {
        NavigationView {
            RootView()
        }
    }

}
