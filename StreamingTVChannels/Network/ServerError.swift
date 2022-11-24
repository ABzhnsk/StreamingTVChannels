//
//  ServerError.swift
//  StreamingTVChannels
//
//  Created by Anna Buzhinskaya on 24.11.2022.
//

import Foundation

enum ServerError: Error {
    case invalidURLError
    case invalidDataError
    case serverError(statusCode: Int)
    case unknownError
    case decodeError
    
    var errorDescription: String {
        switch self {
        case .invalidURLError:
            return "The URL is invalid"
        case .invalidDataError:
            return "Data is not valid"
        case .serverError(let statusCode):
            return "\(statusCode) server error"
        case .unknownError:
            return "Unknown Error"
        case .decodeError:
            return "Decode Error"
        }
    }
}
