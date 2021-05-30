//
//  Endpoint.swift
//  bitbucketrepositories
//
//  Created by Ezaden Seraj on 30/5/21.
//

import Foundation

enum Endpoint {
    case repositories
}

extension Endpoint: RequestProviding {
    var urlRequest: URLRequest {
        switch self {
        case .repositories:
            var apiRequest = APIRequest()
            apiRequest.path = "/2.0/repositories"
            
            guard let url = apiRequest.url else {
                preconditionFailure("Error: Invalid URL used to create URL instance")
            }
            
            return URLRequest(url: url)
        }
    }
}
