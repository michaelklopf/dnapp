//
//  WebViewController.swift
//  DNApp
//
//  Created by Michael on 31.08.15.
//  Copyright © 2015 Michael Klopf. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var url: String!
    var hasFinishedLoading = false

    @IBAction func closeButtonDidTouch(sender: AnyObject) {
        UIApplication.sharedApplication().setStatusBarHidden(false, withAnimation: UIStatusBarAnimation.Fade)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        
        let targetURL = NSURL(string: url)
        let request = NSURLRequest(URL: targetURL!)
        webView.loadRequest(request)
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        hasFinishedLoading = false
        updateProgress()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        delay(1) { [weak self] in
            if let _self = self {
                _self.hasFinishedLoading = true
            }
        }
    }
    
    deinit {
        webView.stopLoading()
        webView.delegate = nil
    }
    
    func updateProgress() {
        if progressBar.progress >= 1 {
            progressBar.hidden = true
        } else {
            if hasFinishedLoading {
                progressBar.progress += 0.002
            } else {
                if progressBar.progress <= 0.3 {
                    progressBar.progress += 0.004
                } else if progressBar.progress <= 0.6 {
                    progressBar.progress += 0.002
                } else if progressBar.progress <= 0.9 {
                    progressBar.progress += 0.001
                } else if progressBar.progress <= 0.94 {
                    progressBar.progress += 0.0001
                } else {
                    progressBar.progress = 0.9401
                }
            }
            
            delay(0.008) { [weak self] in
                if let _self = self {
                    _self.updateProgress()
                }
            }
        }
    }
}
