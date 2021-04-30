//
//  LaunchViewController.swift
//  CafeManager
//
//  Created by Rimshan on 4/30/21.
//  Copyright © 2021 Rimshan. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {

    let sessionMGR = SessionManager()
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
      if sessionMGR.getLoggedState(){
        self.performSegue(withIdentifier: "LaunchToHome", sender: nil)
      }else{
        self.performSegue(withIdentifier: "LaunchToSignIn", sender: nil)
      }
    }
    

}
