//
//  ViewController.swift
//  SwiftReachability
//
//  Created by Claire Roughan on 20/05/2019.
//  Copyright © 2019 Claire Roughan. All rights reserved.
//

import UIKit
import Reachability

class ViewController: UIViewController {
    
    var reachability: Reachability!

    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = UIColor.clear
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged),
                                               name: NSNotification.Name.reachabilityChanged, object: nil);
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name:NSNotification.Name.reachabilityChanged, object: self.view.window)
    }
    
    private func setupLayoutConstraints() {
        
    }
    

    @objc func reachabilityChanged(_ note: Notification) {
        let reachability = note.object as! Reachability
        
        if reachability.isReachable() {
            self.view.backgroundColor = UIColor.green
        } else {
             self.view.backgroundColor = UIColor.red
        }
    }
    
    deinit {
         NotificationCenter.default.removeObserver(self, name:NSNotification.Name.reachabilityChanged, object: self.view.window)
    }
}


