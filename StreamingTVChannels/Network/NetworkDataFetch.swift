//
//  NetworkDataFetch.swift
//  StreamingTVChannels
//
//  Created by Anna Buzhinskaya on 24.11.2022.
//

import Foundation

class NetworkDataFetch {
    static let shared = NetworkDataFetch()
    
    private init() {}
    
    func fetchChannels(api: String, response: @escaping (Result<[Channel], ServerError>) -> Void) {
        NetworkRequest.shared.requestData(api: api) { result in
            switch result {
            case .success(let data):
                do {
                    let json = try JSONDecoder().decode(ResultJSON.self, from: data)
                    print("JSON: \(json)")
                    response(.success(json.channels))
                } catch {
                    response(.failure(.invalidDataError))
                }
            case .failure(_):
                response(.failure(.invalidDataError))
            }
        }
    }
}
