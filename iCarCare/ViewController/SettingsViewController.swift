//
//  SettingsViewController.swift
//  iCarCare
//
//  Created by Operador on 6/18/18.
//  Copyright © 2018 ACME. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var showOnboardingSwitch: UISwitch!
    let settings = SettingsRepository()
    override func viewDidLoad() {
        super.viewDidLoad()
        showOnboardingSwitch.setOn(settings.onboardingShouldAppear, animated: true)
    }

    @IBAction func showOnboardingAction(_ sender: UISwitch) {
        settings.onboardingShouldAppear = sender.isOn
    }
}
