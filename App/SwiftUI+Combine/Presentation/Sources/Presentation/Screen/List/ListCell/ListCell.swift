//
//  ListCell.swift
//  GitHubViewer-SwiftUI+Combine
//
//  Created by クォン ジュンヒョク on 2022/07/02.
//

import SwiftUI

struct ListCell: View {
    
    private let repositoryModel: String
    
    init(repositoryModel: String) {
        self.repositoryModel = repositoryModel
    }
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "")
                    .frame(width: 80, height: 80)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                VStack {
                    Group {
                        Text("Hello, world!")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Spacer()
                            .frame(height: 2)
                        
                        Text("Hello, world!")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Spacer()
                            .frame(height: 2)
                        
                        Text("Hello, world!")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Spacer()
                            .frame(height: 2)
                        
                        HStack(spacing: 2) {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            
                            Text("Hello, world!")
                                .font(.subheadline)
                        }
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            Text("Hello, world!")
                .font(.subheadline)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListCell(repositoryModel: "").previewLayout(.fixed(width: 375, height: 150))
    }
}
