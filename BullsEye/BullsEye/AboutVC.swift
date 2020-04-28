//
//  AboutVC.swift
//  BullsEye
//
//  Created by Volodymyr Ostapyshyn on 27.04.2020.
//  Copyright © 2020 Volodymyr Ostapyshyn. All rights reserved.
//

import UIKit
import WebKit

class AboutVC: UIViewController {
    
    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html") {
            let url = URL(fileURLWithPath: htmlPath)
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    @IBAction func touchClose(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
