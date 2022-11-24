//
//  NetworkRequest.swift
//  StreamingTVChannels
//
//  Created by Anna Buzhinskaya on 24.11.2022.
//

import Foundation

class NetworkRequest {
    static let shared = NetworkRequest()
    
    private init() {}
    
    func requestData(api: String, completion: @escaping (Result<Data, ServerError>) -> Void) {
        guard let url = URL(string: api) else {
            completion(.failure(.invalidURLError))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                guard let httpResponse = response as? HTTPURLResponse else {
                    completion(.failure(.unknownError))
                    return
                }
                if error != nil {
                    completion(.failure(.serverError(statusCode: httpResponse.statusCode)))
                    return
                }
                guard 200..<300 ~= httpResponse.statusCode else {
                    completion(.failure(.serverError(statusCode: httpResponse.statusCode)))
                    return
                }
                guard let data = data else {
                    completion(.failure(.invalidDataError))
                    return
                }
                print("DATA: \(data)")
                completion(.success(data))
            }
        }
        .resume()
    }
}
