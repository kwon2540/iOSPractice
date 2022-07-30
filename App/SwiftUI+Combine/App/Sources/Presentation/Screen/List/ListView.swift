//
//  ListView.swift
//  GitHubViewer-SwiftUI+Combine
//
//  Created by クォン ジュンヒョク on 2022/07/02.
//

import SwiftUI
import WebKit
import Domain

public struct ListView: View {
    
    @State private var keyword: String = ""
    @State private var repositoryList: [GitHubRepositoryModel]  = []
    @State private var downloadTask: Task<(), Never>?
        
    private let gitHubSearchUseCase: GitHubSearchUseCaseProtocol
    private let detailBuilder: DetailBuilder
    
    public init(gitHubSearchUseCase: GitHubSearchUseCaseProtocol, detailBuilder: DetailBuilder) {
        self.gitHubSearchUseCase = gitHubSearchUseCase
        self.detailBuilder = detailBuilder
    }
    
    public var body: some View {
        NavigationView {
            VStack {
                SearchBar { keyword in
                    self.downloadTask?.cancel()
                    self.downloadTask = Task {
                        do {
                            if !keyword.isEmpty {
                                let gitHubSearchModel = try await gitHubSearchUseCase.execute(keyword: keyword)
                                self.repositoryList = gitHubSearchModel.items
                            } else {
                                self.repositoryList.removeAll()
                            }
                        } catch(let error) {
                            if Task.isCancelled {
                                print("Canceled")
                            } else {
                                print(error.localizedDescription)
                            }
                        }
                    }
                }
                
                List {
                    ForEach(repositoryList) { model in
                        NavigationLink {
                            detailBuilder.detailView(url: model.htmlUrl, title: model.name)
                        } label: {
                            ListCell(model: model)
                        }
                    }
                }
                .listStyle(.plain)
            }
            .navigationBarHidden(true)
        }
    }
}

struct SearchBar: View {

    @State private var keyword: String = ""
    
    let onChange: (String) -> Void
    
    init(onChange: @escaping (String) -> Void) {
        self.onChange = onChange
    }

    var body: some View {
        VStack {
            ZStack {
                // 背景
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(red: 239 / 255,
                                green: 239 / 255,
                                blue: 241 / 255))
                    .frame(height: 36)

                HStack(spacing: 6) {

                    // 虫眼鏡
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)

                    // テキストフィールド
                    TextField("Search", text: $keyword)
                        .onChange(of: keyword) { keyword in
                            onChange(keyword)
                        }

                    // 検索文字が空ではない場合は、クリアボタンを表示
                    if !keyword.isEmpty {
                        Button {
                            keyword.removeAll()
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                        }
                        .padding(.trailing, 6)
                    }
                }
                .padding(.horizontal, 6)
            }
            .padding(.horizontal)
        }
    }
}

//struct ListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListView(gitHubSearchUseCase: )
//    }
//}
