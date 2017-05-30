//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by Robert Wong on 5/30/17.
//  Copyright © 2017 Robert Wong. All rights reserved.
//

import UIKit
import WebKit


class WebViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //view can be initalized in loadView or viewDidLoad. Don't know the difference between the two
        view = webView
        
        let testURL = URL(string: "https://www.bignerdranch.com")
        let requestURL = URLRequest(url:testURL!)
        
        webView.load(requestURL)
    }
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        //webView = WKWebView()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        //view = webView
        
        print ("WebViewController loaded its view.")
    }
}
