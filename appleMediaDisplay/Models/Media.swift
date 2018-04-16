//
//  Media.swift
//  appleMediaDisplay
//
//  Created by Ashlee Krammer on 4/16/18.
//  Copyright © 2018 Ashlee Krammer. All rights reserved.
//

import Foundation

struct FeedWrapper: Codable {
    let feed: Feed
}

struct Feed: Codable {
    let results: [Result]
}

struct Result: Codable {
    let artistName: String
    let name: String
    let kind: String
    let artworkUrl100: String
}
