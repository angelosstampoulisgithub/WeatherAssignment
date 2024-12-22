//
//  ContentView.swift
//  WeatherAssignment
//
//  Created by Angelos Staboulis on 17/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeView(currentWeather:.init(location:.init(name: "", region: "", country: "", lat: 0.0, lon: 0.0, tzID: "", localtimeEpoch: 0, localtime: ""), current: .init(lastUpdatedEpoch: 0, lastUpdated: "", tempC: 0.0, tempF: 0.0, isDay: 0.0, condition: .init(text: "", icon: "", code: 0), windMph: 0.0, windKph: 0.0, windDegree: 0.0, windDir: "", pressureMB: 0.0, pressureIn: 0.0, precipMm: 0.0, precipIn: 0.0, humidity: 0.0, cloud: 0.0, feelslikeC: 0.0, feelslikeF: 0.0, windchillC: 0.0, windchillF: 0.0, heatindexC: 0.0, heatindexF: 0.0, dewpointC: 0.0, dewpointF: 0.0, visKM: 0.0, visMiles: 0.0, uv: 0.0, gustMph: 0.0, gustKph: 0.0)), currentWeatherData: .init(name: "", temperature: 0.0), city: "", isSearching: false)
    }
}

