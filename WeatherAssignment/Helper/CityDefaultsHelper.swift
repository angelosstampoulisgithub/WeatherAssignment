//
//  CityDefaultsHelper.swift
//  WeatherAssignment
//
//  Created by Angelos Staboulis on 18/12/24.
//

import Foundation

struct CityDefaultsHelper {
    
    static func saveCity(_ city: String) {
        let defaults = UserDefaults.standard
        defaults.set(city, forKey: KeyConstants.savedCity.rawValue)
    }
    
    static func getCity() -> String? {
        let defaults = UserDefaults.standard
        if let city = defaults.string(forKey: KeyConstants.savedCity.rawValue)
        {
            return city
        }
        
        return nil
    }

}
