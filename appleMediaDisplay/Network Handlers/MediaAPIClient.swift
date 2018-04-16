//
//  MediaAPIClient.swift
//  appleMediaDisplay
//
//  Created by Ashlee Krammer on 4/16/18.
//  Copyright © 2018 Ashlee Krammer. All rights reserved.
//

import Foundation

struct MediaAPIClient{
    private init() {}
    static let manager = MediaAPIClient()
    func getMedia(from urlStr: String, completionHandler: @escaping ([Result]) -> Void, errorHandler: @escaping (AppError) -> Void){
        
        
        guard let url = URL(string: urlStr) else{
            errorHandler(.badURL)
            return
        }
        
        let completion: (Data) -> Void = {(data: Data) in
            
            do {
                let myDecoder = JSONDecoder()
                let mediaSearch = try myDecoder.decode(FeedWrapper.self, from: data)
                completionHandler(mediaSearch.feed.results)
                
            } catch {
                print("Media API Client Has This Error: " + error.localizedDescription)
                errorHandler(.couldNotParseJSON)
            }
        }
        
        NetworkHelper.manager.performDataTask(with: URLRequest(url: url), completionHandler: completion, errorHandler: errorHandler)
    }
}
