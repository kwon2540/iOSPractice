//
//  ListCell.swift
//  GitHubViewer-SwiftUI+Combine
//
//  Created by クォン ジュンヒョク on 2022/07/02.
//

import SwiftUI
import Domain

struct ListCell: View {
    
    private let model: GitHubRepositoryModel
    
    init(model: GitHubRepositoryModel) {
        self.model = model
    }
    
    var body: some View {
        VStack {
            HStack {
                AsyncImage(url: model.owner.avatarUrl) { image in
                    image.resizable().scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                
                VStack {
                    Group {
                        Text(model.name)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Spacer()
                            .frame(height: 2)
                        
                        Text(model.owner.login)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Spacer()
                            .frame(height: 2)
                        
                        Text(model.language ?? "")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Spacer()
                            .frame(height: 2)
                        
                        HStack(spacing: 2) {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            
                            Text(model.stargazersCount)
                                .font(.subheadline)
                        }
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            Text(model.description ?? "")
                .font(.subheadline)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static let dummyModel = GitHubRepositoryModel(id: "1",
                                           name: "name",
                                           fullName: "fullName",
                                           owner: GitHubRepositoryOwnerModel(id: "id", login: "login", avatarUrl: URL(string: "https://picsum.photos/200")!),
                                           htmlUrl: URL(string: "https://www.example.com")!,
                                           description: "description",
                                           language: "language",
                                           stargazersCount: "50000")
    static var previews: some View {
        ListCell(model: dummyModel).previewLayout(.fixed(width: 375, height: 150))
    }
}
