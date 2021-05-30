//
//  Endpoint.swift
//  bitbucketrepositories
//
//  Created by Ezaden Seraj on 30/5/21.
//

import Foundation

enum Endpoint {
    case repositories
    case nextPage(urlString: String)
}

extension Endpoint: RequestProvider {
    var urlRequest: URLRequest {
        switch self {
        case .repositories:
            var apiRequest = APIRequest()
            apiRequest.path = "/2.0/repositories"
            
            guard let url = apiRequest.url else {
                preconditionFailure("Error: Invalid URL used to create URL instance")
            }
            
            return URLRequest(url: url)
        case .nextPage(let urlString):
            guard let url = URL(string: urlString) else {
                preconditionFailure("Error: Invalid URL used to create URL instance")
            }

            var apiRequest = APIRequest()
            apiRequest.path = url.path

            var queryItems = [URLQueryItem]()
            queryItems.append(URLQueryItem(name: "after", value: url.valueOf("after")))
            apiRequest.queryItems = queryItems

            return URLRequest(url: url)
        }
    }
}
