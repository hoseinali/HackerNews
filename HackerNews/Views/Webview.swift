//
//  Webview.swift
//  HackerNews
//
//  Created by Hossein Ali Alborzi on 1/10/22.
//

import Foundation
import SwiftUI
import WebKit

struct Webview: UIViewRepresentable {
    typealias UIViewType = WKWebView
    
    var url: String
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: self.url) else {
            return WKWebView.pageNotFoundView()
        }
        let request = URLRequest.init(url: url)
        let wKWebView = WKWebView()
        wKWebView.load(request)
        return wKWebView
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let url = URL(string: self.url) else {
            return
        }
        let request = URLRequest(url: url)
        uiView.load(request)
    }
    
    
}
