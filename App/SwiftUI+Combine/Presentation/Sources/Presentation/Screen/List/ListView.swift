//
//  ListView.swift
//  GitHubViewer-SwiftUI+Combine
//
//  Created by クォン ジュンヒョク on 2022/07/02.
//

import SwiftUI
import WebKit

struct ListView: View {
    @State private var text: String = ""
    
    @State private var repositoryList = [1,2,3,4,5]
    
    @State private var showDetailView = false
        
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $text)
                List {
                    ForEach(repositoryList, id: \.self) { _ in
                        NavigationLink {
                            DetailView(url: URL(string: "https://www.example.com")!, title: "Example")
                        } label: {
                            ListCell(repositoryModel: "")
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

    @Binding var text: String

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
                    TextField("Search", text: $text)

                    // 検索文字が空ではない場合は、クリアボタンを表示
                    if !text.isEmpty {
                        Button {
                            text.removeAll()
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

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
