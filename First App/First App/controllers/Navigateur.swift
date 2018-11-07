//
//  Navigateur.swift
//  First App
//
//  Created by JDLR on 08/10/2018.
//  Copyright © 2018 JDLR. All rights reserved.
//

import Foundation
import UIKit

class Navigateur: UIViewController, UIWebViewDelegate, UISearchBarDelegate {
    @IBOutlet var wv: UIWebView!
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            if let url = NSURL(string: text) {
                let request = NSURLRequest(url: url as URL)
                wv.loadRequest(request as URLRequest)
            }
        }
    }
    
    @IBAction func arriere(sender: UIBarButtonItem) {
        if wv.canGoBack {
            wv.goBack()
        }
    }
    
    @IBAction func avant(sender: UIBarButtonItem) {
        if wv.canGoForward {
            wv.goForward()
        }
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        if let html = webView.stringByEvaluatingJavaScript(from: "document.documentElement.outerHTML") {
            
        }
    }
    
    func colorTopBar(htmlString: String) {
        let scan = Scanner(string: htmlString)
        
        if scan.scanUpTo("<meta name=\"theme-color\" content=\"#", into: nil) {
            scan.scanString("<meta name=\"theme-color\" content=\"#", into: nil)
            var themeColor: NSString?
            
            if scan.scanUpTo("\"", into: &themeColor) {
                var themeInt: UInt32 = 0
                
                Scanner(string: themeColor! as String).scanHexInt32(&themeInt)
                
                let rouge = CGFloat((themeInt & 0xFF0000) >> 16) / 255
                let vert = CGFloat((themeInt & 0x00FF00) >> 8) / 255.0
                let bleu = CGFloat(themeInt & 0x0000FF) / 255.0
                let color = UIColor(red: rouge, green: vert, blue: bleu, alpha: 1.0)
                
                UIView.animate(withDuration: 0.3, animations: {
                    self.navigationController?.navigationBar.barTintColor = color
                    })
            }
        }
    }
}
