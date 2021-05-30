//
//  APIService.swift
//  bitbucketrepositories
//
//  Created by Ezaden Seraj on 30/5/21.
//

import Foundation

protocol Networking {
    func fetchData<T: Decodable>(_ endPoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void)
}

protocol RequestProvider {
    var urlRequest: URLRequest { get }
}

class APIService: Networking {
    func fetchData<T: Decodable>(_ endPoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void) {
        let urlRequest = endPoint.urlRequest

        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            do {
                if let error = error {
                    completion(.failure(error))
                    return
                }

                guard let data = data else {
                    preconditionFailure("No error was received but we also don't have data...")
                }

                let decodedObject = try JSONDecoder().decode(T.self, from: data)

                completion(.success(decodedObject))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
