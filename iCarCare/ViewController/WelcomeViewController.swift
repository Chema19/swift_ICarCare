//
//  WelcomeViewController.swift
//  iCarCare
//
//  Created by Operador on 6/15/18.
//  Copyright © 2018 ACME. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBAction func startAction(_ sender: UIButton) {
        let settings = SettingsRepository()
        settings.onboardingDidAppear = true
        self.dismiss(animated: true)
    }
}
