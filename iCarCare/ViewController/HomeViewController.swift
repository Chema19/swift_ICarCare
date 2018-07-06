//
//  ViewController.swift
//  iCarCare
//
//  Created by Operador on 6/15/18.
//  Copyright © 2018 ACME. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let settings = SettingsRepository()
        if settings.onboardingShouldAppear {
            self.performSegue(withIdentifier: "showOnboarding", sender: self)
        }
    }

}

