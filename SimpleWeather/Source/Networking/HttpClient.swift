//
//  HttpClient.swift
//  SimpleWeather
//
//  Created by Jakub Kurgan on 15/12/2019.
//  Copyright © 2019 Jakub Kurgan. All rights reserved.
//

import Foundation

enum HttpClientError: Error {
    case noData
    case invalidURL
}

extension HttpClientError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .noData:
            return "noDataErrorMesssage".localized
        case .invalidURL:
            return "invalidUrlErrorMessage".localized
        }
    }
}

protocol HttpClient {
    func request(path: String, queryParams: [URLQueryItem], _ completion: @escaping (Result<Data, Error>) -> Void)
}

struct BaseHttpClient: HttpClient {
    
    private let session = URLSession.shared
    private let baseURL = URL(string:  ApplicationConstants.Networking.baseURL.rawValue)
    
    func request(path: String, queryParams: [URLQueryItem] = [], _ completion: @escaping (Result<Data, Error>) -> Void) {
        
        guard let url = baseURL?.appendingPathComponent(path) else {
            completion(.failure(HttpClientError.invalidURL))
            return
        }
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        components?.queryItems = queryParams
        
        guard let urlWithParams = components?.url else {
            completion(.failure(HttpClientError.invalidURL))
            return
        }
        
        let task = session.dataTask(with: urlWithParams) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let httpResponse = response as? HTTPURLResponse else {
                    completion(.failure(HttpClientError.noData))
                    return
                }
                
                guard (200...299).contains(httpResponse.statusCode) else {
                    let status = httpResponse.value(forHTTPHeaderField: "status")
                    completion(.failure(NSError(domain: status ?? "", code: httpResponse.statusCode, userInfo: [:])))
                    return
                }
                                
                guard let data = data else {
                    completion(.failure(HttpClientError.noData))
                    return
                }
                completion(.success(data))
                
            }
        }
        task.resume()
    }
}
