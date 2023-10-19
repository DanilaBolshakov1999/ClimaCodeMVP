//
//  NetworkService.swift
//  ClimaCodeMVP
//
//  Created by Danila Bolshakov on 18.10.2023.
//

import Foundation
import CoreLocation

//MARK: - NetworkServiceProtocol
protocol NetworkServiceProtocol {
    func getSetup(completion: @escaping (Result<[WetherModel]?, Error>) -> Void)
}

//MARK: - WeatherManagerDelegate
protocol WeatherManagerDelegate {
    func didUpdateWether(model: WetherModel)
    func didFailWithError(error: Error)
}

//MARK: - FetchWeather
protocol FetchWeatherProtocol {
    func fetchWeather(cityName: String)
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees)
}

//MARK: - NetworkServiceProtocol

final class NetworkService: NetworkServiceProtocol {
    
    //MARK: - Private Properties
    private let baseURL = "https://api.thecatapi.com/v1/images/search"
    private let apiKey = "live_B2ZnG91wVZ2PDfZ0MHM8CfwLMqLO4ThjweHJqrHMBofVMon934k33YUX0dCVzaqw"
    
    func getSetup(completion: @escaping (Result<[WetherModel]?, Error>) -> Void) {
        let queryString = "?units=metric&appid=\(apiKey)"
        let urlString = baseURL + queryString
        guard let url = URL(string: urlString) else { return }
        
        //MARK: - URLSession
        URLSession.shared.dataTask(with: url) { data, response, fetchError in
            if let fetchError = fetchError {
                completion(.failure(fetchError))
                print("Error")
                return
            }
            do {
                let decoder = JSONDecoder()
                let task = try decoder.decode([WetherModel].self, from: data ?? Data())
                print(completion(.success(task)))
                completion(.success(task))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

//MARK: - NetworkService
extension NetworkService: WeatherManagerDelegate {
    func didUpdateWether(model: WetherModel) { }
    func didFailWithError(error: Error) { }
}

//MARK: - FetchWeatherProtocol
extension NetworkService: FetchWeatherProtocol {
    func fetchWeather(cityName: String) { }
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) { }
}
