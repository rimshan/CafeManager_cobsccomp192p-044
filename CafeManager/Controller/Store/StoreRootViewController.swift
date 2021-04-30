//
//  StoreRootViewController.swift
//  CafeManager
//
//  Created by Rimshan on 4/30/21.
//  Copyright © 2021 Rimshan. All rights reserved.
//

import UIKit

class StoreRootViewController: UIViewController {

    var tabBarContainer: UITabBarController?
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tabBarSegue"{
            self.tabBarContainer = segue.destination as? UITabBarController
        }
        self.tabBarContainer?.tabBar.isHidden = true
    }
    
    @IBAction func onSegIndexChanged(_ sender: UISegmentedControl) {
        tabBarContainer?.selectedIndex = sender.selectedSegmentIndex
    }
    
}
