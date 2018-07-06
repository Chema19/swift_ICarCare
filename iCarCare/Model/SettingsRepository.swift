//
//  SettingsRepository.swift
//  iCarCare
//
//  Created by Operador on 6/18/18.
//  Copyright © 2018 ACME. All rights reserved.
//

import Foundation
import CoreLocation

class SettingsRepository {
    let settings = UserDefaults.standard
    var onboardingDidAppear: Bool {
        get {
            return settings.bool(forKey: "onboardingDidAppear")
        }
        set {
            settings.set(newValue, forKey: "onboardingDidAppear")
        }
    }
    var onboardingShouldAppear: Bool {
        get {
            return !self.onboardingDidAppear
        }
        set {
            self.onboardingDidAppear = !newValue
        }
    }
    
    var savedLocation: CLLocation? {
        get {
            let latitude = settings.double(forKey: "savedLatitude")
            let longitude = settings.double(forKey: "savedLongitude")
            if latitude == 0 && longitude == 0 {
                return nil
            }
            return CLLocation(latitude: latitude, longitude: longitude)
        }
        set {
            if let location = newValue as CLLocation? {
                settings.set(location.coordinate.latitude, forKey: "savedLatitude")
                settings.set(location.coordinate.longitude, forKey: "savedLongitude")
                return
            }
            settings.removeObject(forKey: "savedLatitude")
            settings.removeObject(forKey: "savedLongitude")
        }
    }
    var hasSavedLocation: Bool {
        return self.savedLocation != nil
    }
}



