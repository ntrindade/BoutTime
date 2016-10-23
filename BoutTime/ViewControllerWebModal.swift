//
//  ViewControllerWebModal.swift
//  BoutTime
//
//  Created by Nuno Trindade on 28/09/16.
//  Copyright © 2016 Remarkable Code Ltd. All rights reserved.
//

import UIKit

class ViewControllerWebModal: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var webView: UIWebView!
    
    @IBAction func dismissWebModal() {
        dismiss(animated: true, completion: nil)
    }
    
    func loadUrl(eventsUrl: URL) {
        webView?.loadRequest(URLRequest(url: eventsUrl))
    }
}
