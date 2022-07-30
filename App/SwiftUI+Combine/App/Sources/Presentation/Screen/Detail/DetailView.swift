//
//  DetailView.swift
//  GitHubViewer-SwiftUI+Combine
//
//  Created by クォン ジュンヒョク on 2022/07/10.
//

import SwiftUI
import WebKit

public struct DetailView: View {
    
    private let url: URL
    private let title: String
    
    public init(url: URL, title: String) {
        self.url = url
        self.title = title
    }
    
    public var body: some View {
        WebView(url: url)
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
    }
}
 
struct WebView: UIViewRepresentable {
 
    private let url: URL
    
    init(url: URL) {
        self.url = url
    }
 
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        let request = URLRequest(url: url)
        webView.load(request)
        return webView
    }
 
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: URL(string: "https://www.example.com")!, title: "Example")
    }
}
