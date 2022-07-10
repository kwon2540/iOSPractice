//
//  DetailView.swift
//  GitHubViewer-SwiftUI+Combine
//
//  Created by クォン ジュンヒョク on 2022/07/10.
//

import SwiftUI
import WebKit

struct DetailView: View {
    
    let url: URL
    
    let title: String
    
    var body: some View {
        WebView(url: url)
            .navigationTitle(title)
    }
}
 
struct WebView: UIViewRepresentable {
 
    let url: URL
 
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
