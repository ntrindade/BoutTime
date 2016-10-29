//
//  ViewControllerWebModal.swift
//  BoutTime
//
//  Created by Nuno Trindade on 28/09/16.
//  Copyright © 2016 Remarkable Code Ltd. All rights reserved.
//

import UIKit
import WebKit

class ViewControllerWebModal: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var webView: WKWebView!
    var urlString: String = "http://teamtreehouse.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView()
        webView.navigationDelegate = self
        viewContainer.addSubview(webView)
    }

    override func viewDidAppear(_ animated: Bool) {
        let frame = CGRect(x: 0, y: 0, width: viewContainer.bounds.width, height: viewContainer.bounds.height)
        webView.frame = frame
        loadUrl()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func dismissWebModal() {
        dismiss(animated: true, completion: nil)
    }
    
    func loadUrl() {
        if webView != nil {
            let url = URL(string: urlString)!
            let urlRequest = URLRequest(url: url)
            webView.load(urlRequest)
        }
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activityIndicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
}
