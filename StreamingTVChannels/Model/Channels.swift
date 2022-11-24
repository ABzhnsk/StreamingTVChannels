//
//  Channels.swift
//  StreamingTVChannels
//
//  Created by Anna Buzhinskaya on 24.11.2022.
//

import Foundation

struct ResultJSON: Codable {
    let channels: [Channel]
}
struct Channel: Codable {    
    let url: String
}
