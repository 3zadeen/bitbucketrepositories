//
//  APIRequest.swift
//  bitbucketrepositories
//
//  Created by Ezaden Seraj on 30/5/21.
//

import Foundation

struct APIRequest {
    private var urlComponents = URLComponents()
    
    init() {
        urlComponents.scheme = "https"
        urlComponents.host = "api.bitbucket.org"
    }
}

extension APIRequest {
    var path: String {
        get {
            urlComponents.path
        }
        
        set {
            urlComponents.path = newValue
        }
    }
    
    var queryItems: [URLQueryItem]? {
        get {
            urlComponents.queryItems
        }
        
        set {
            urlComponents.queryItems = newValue
        }
    }
    
    var url: URL? {
        urlComponents.url
    }
}
