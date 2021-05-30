//
//  RepositoriesProvider.swift
//  bitbucketrepositories
//
//  Created by Ezaden Seraj on 30/5/21.
//

import Foundation

enum Result<Success, Failure> where Failure: Error {
    case success(Success)
    case failure(Failure)
}

class RepositoriesProvider {
    typealias Completion<T> = (Result<T, Error>) -> Void

    let service: APIService
    
    init(with networking: APIService) {
        self.service = networking
    }
    
    func getRepositories(completion: @escaping Completion<Repositories>) {
        service.fetchData(.repositories, completion: completion)
    }
    
    func getNexPage(from urlString: String, completion: @escaping Completion<Repositories>) {
        service.fetchData(.nextPage(urlString: urlString), completion: completion)
    }
}
