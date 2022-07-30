//
//  RootView.swift
//  
//
//  Created by クォン ジュンヒョク on 2022/07/10.
//

import SwiftUI

public struct RootView: View {
    
    private let listBuilder: ListBuilder
    
    public init(listBuilder: ListBuilder) {
        self.listBuilder = listBuilder
    }
    
    public var body: some View {
        listBuilder.listView
    }
}
