//
//  WebView.swift
//  p3m4_8
//
//  Created by Amina TomasMart on 19.03.2024.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    typealias WebView = WKWebView
    var stringUrl: String
    @Binding var loaded: Bool
    
    func makeUIView(context: Context) -> some UIView {
        let webView = WebView()
        if let url = URL(string: stringUrl) {
            let req = URLRequest(url: url)
            webView.load(req)
        }
        webView.navigationDelegate = context.coordinator
        return webView
    }
    
    func makeCoordinator() -> WebCoordinator {
        WebCoordinator { loaded in
            self.loaded = loaded
        }
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

final class WebCoordinator: NSObject, WKNavigationDelegate {
    var loaded: (Bool) -> ()
    init(loaded: @escaping (Bool) -> Void) {
        self.loaded = loaded
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loaded(true)
    }
}
