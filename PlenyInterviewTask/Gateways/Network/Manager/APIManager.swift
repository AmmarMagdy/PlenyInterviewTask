//
//  APIManager.swift
//  Network
//
//  Created by Ammar.M on 14/09/2023.
//

import Foundation
import Combine

protocol APIClient {
    func request<T: Decodable>(_ endpoint: APIEndpoint) -> AnyPublisher<T, Error>
}

class URLSessionAPIClient: APIClient {
    
    func request<T: Decodable>(_ endpoint: APIEndpoint) -> AnyPublisher<T, Error> {
        
        let url = endpoint.baseURL.appendingPathComponent(endpoint.path)
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)

        urlComponents?.queryItems = endpoint.queryParameter
    
        var request = URLRequest(url: urlComponents?.url ?? url)
        request.httpMethod = endpoint.method.rawValue
        if let data = convertDictionaryToData(dictionary: endpoint.parameters) {
            request.httpBody = data
        } else {
            print("Failed to convert dictionary to data.")
        }
        
        endpoint.headers?.forEach { request.addValue($0.value, forHTTPHeaderField: $0.key) }
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    throw APIError.invalidResponse
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func convertDictionaryToData(dictionary: [String: Any]?) -> Data? {
        guard let dictionary = dictionary else { return nil }
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dictionary, options: [])
            return jsonData
        } catch {
            print("Error converting dictionary to data: \(error)")
        }
        return nil
    }
}
