//
//  Weather.swift
//  WeatherAssignment
//
//  Created by Angelos Staboulis on 18/12/24.
//

import Foundation
struct Weather: Codable {
    var location: Location
    var current: Current
}

// MARK: - Current
struct Current: Codable {
    var lastUpdatedEpoch: Int
    var lastUpdated: String
    var tempC, tempF, isDay: Double
    var condition: Condition
    var windMph: Double
    var windKph, windDegree: Double
    var windDir: String
    var pressureMB: Double
    var pressureIn: Double
    var precipMm, precipIn, humidity, cloud: Double
    var feelslikeC, feelslikeF, windchillC, windchillF: Double
    var heatindexC: Double
    var heatindexF: Double
    var dewpointC, dewpointF: Double
    var visKM, visMiles, uv: Double
    var gustMph, gustKph: Double

    enum CodingKeys: String, CodingKey {
        case lastUpdatedEpoch = "last_updated_epoch"
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressureMB = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case humidity, cloud
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case windchillC = "windchill_c"
        case windchillF = "windchill_f"
        case heatindexC = "heatindex_c"
        case heatindexF = "heatindex_f"
        case dewpointC = "dewpoint_c"
        case dewpointF = "dewpoint_f"
        case visKM = "vis_km"
        case visMiles = "vis_miles"
        case uv
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
    }
}

// MARK: - Condition
struct Condition: Codable {
    var text, icon: String
    var code: Int
    init(text:String,icon:String,code:Int) {
        self.text = text
        self.icon = icon
        self.code = code
    }
    // Custom initializer to process the icon value
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        text = try container.decode(String.self, forKey: .text)
        let rawIcon = try container.decode(String.self, forKey: .icon)
        icon = rawIcon.hasPrefix("https:") ? rawIcon : "https:" + rawIcon
        code = try container.decode(Int.self, forKey: .code)
    }
}

// MARK: - Location
struct Location: Codable {
    var name, region, country: String
    var lat, lon: Double
    var tzID: String
    var localtimeEpoch: Int
    var localtime: String

    enum CodingKeys: String, CodingKey {
        case name, region, country, lat, lon
        case tzID = "tz_id"
        case localtimeEpoch = "localtime_epoch"
        case localtime
    }
}

struct City: Codable {
    var id: Int
    var name, region, country: String
    var lat, lon: Double
    var url: String
}
