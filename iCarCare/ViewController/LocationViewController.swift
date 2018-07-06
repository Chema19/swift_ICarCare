//
//  LocationViewController.swift
//  iCarCare
//
//  Created by Operador on 6/15/18.
//  Copyright © 2018 ACME. All rights reserved.
//

import UIKit
import CoreLocation

class LocationViewController: UIViewController {
    @IBOutlet weak var showLocationButton: UIButton!
    let settings = SettingsRepository()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocation()
        showLocationButton.isEnabled = settings.hasSavedLocation
    }

    @IBAction func saveLocationAction(_ sender: UIButton) {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestLocation()
        }
    }

    @IBAction func showLocationAction(_ sender: UIButton) {
        self.performSegue(withIdentifier: "showLocation", sender: self)
    }
}

extension LocationViewController: CLLocationManagerDelegate {
    
    func setupLocation() {
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            settings.savedLocation = location
            showLocationButton.isEnabled = settings.hasSavedLocation
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        NSLog("Location Error: \(error.localizedDescription)")
    }
}









