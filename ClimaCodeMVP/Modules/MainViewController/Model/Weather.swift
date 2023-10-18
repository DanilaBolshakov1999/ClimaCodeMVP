//
//  Weather.swift
//  ClimaCodeMVP
//
//  Created by Danila Bolshakov on 18.10.2023.
//

import Foundation

//MARK: - Model WeatherData
struct WetherModel: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let id: Double
    let main: String
    let description: String
    let icon: String
}
