//
//  NASARequestModel.swift
//  NASAPhotoOfTheDay
//
//  Created by Ginny Pennekamp on 3/15/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import Foundation


struct NASARequest {
    
    // MARK: - Properties
    
    struct NASAURL {
        static let Scheme: String = "https"
        static let Host: String = "api.nasa.gov"
        static let Path: String = "/planetary/apod"
    }
    
    struct NASAParameterKeys {
        static let APIKey: String = "api_key"
    }
    
    struct NASAParameterValues {
        static let APIKey: String = YOUR_API_KEY
    }
    
    struct ResponseKeys {
        static let date: String = "date"
        static let title: String = "title"
        static let description: String = "explanation"
        static let imageURL: String = "url"
    }
    
    func buildURL() -> URL {
        var components = URLComponents()
        components.scheme = NASAURL.Scheme
        components.host = NASAURL.Host
        components.path = NASAURL.Path
        components.queryItems = [URLQueryItem(name: NASAParameterKeys.APIKey, value: NASAParameterValues.APIKey)]
        return components.url!
    }
}
