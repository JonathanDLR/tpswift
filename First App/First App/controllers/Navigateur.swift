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
}
