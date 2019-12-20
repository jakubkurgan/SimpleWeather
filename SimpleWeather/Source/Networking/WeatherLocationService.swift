//
//  WeatherLocationService.swift
//  SimpleWeather
//
//  Created by Jakub Kurgan on 15/12/2019.
//  Copyright © 2019 Jakub Kurgan. All rights reserved.
//

import Foundation
import SimpleNetworking

struct WeatherLocationService {
    static func searchLocation(by query: String, completion: @escaping (Result<[Location], Error>) -> Void) {
        let querySearchItem = URLQueryItem(name: "query",
                                           value: query)
        
        BaseHttpClient(baseURL: URL(string: ApplicationConstants.Networking.baseURL.rawValue)).request(path: "api/location/search/", queryParams: [querySearchItem]) { result in
            switch result {
            case .success(let data):
                do {
                    completion(.success(try JSONHelper.decodeToObject(from: data)))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    static func getLocationWeather(by woeid: Int, completion: @escaping (Result<LocationWeather, Error>) -> Void) {
      
        BaseHttpClient(baseURL: URL(string: ApplicationConstants.Networking.baseURL.rawValue)).request(path: "api/location/\(woeid)/") { result in
            switch result {
            case .success(let data):
                do {
                    completion(.success(try JSONHelper.decodeToObject(from: data)))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
