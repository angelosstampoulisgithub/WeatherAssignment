//
//  WeatherData.swift
//  WeatherAssignment
//
//  Created by Angelos Staboulis on 22/12/24.
//

import Foundation
import SwiftData
@Model
class WeatherData {
    var name: String
    var temperature: Double
    init(name: String, temperature: Double) {
        self.name = name
        self.temperature = temperature
    }
    
}
