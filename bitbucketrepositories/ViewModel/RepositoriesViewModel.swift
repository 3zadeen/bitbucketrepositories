//
//  RepositoriesViewModel.swift
//  bitbucketrepositories
//
//  Created by Ezaden Seraj on 30/5/21.
//

import Foundation

enum NetworkingError: Error {
    case notFound(error: Error)
}

extension NetworkingError: LocalizedError {
    var description: String {
        switch self {
        case .notFound(let error):
            return  NSLocalizedString(error.localizedDescription, comment: "Data not found!, check if data is decoded correctly")
        }
    }
}

class RepositoriesViewModel {

    let provider: RepositoriesProvider
    
    private(set) var repositories: [Repository]?
    
    private(set) var nextPageURL: String?
    
    init(with provider: RepositoriesProvider) {
        self.provider = provider
    }
    
    func getRepositories(completion: @escaping (Error?) -> Void) {
        provider.getRepositories { [weak self] result in
            guard let self = self else {return}
            
            switch result {
            case .success(let repositories):
                self.repositories = repositories.repositories
                self.nextPageURL = repositories.next
                completion(nil)
            case .failure(let error):
                completion(NetworkingError.notFound(error: error))
            }
        }
    }
    
    func getNextPage(from urlString: String, completion: @escaping (Error?) -> Void) {
        provider.getNexPage(from: urlString) { [weak self] result in
            guard let self = self else {return}
            
            switch result {
            case .success(let repositories):
                self.repositories = repositories.repositories
                self.nextPageURL = repositories.next
                completion(nil)
            case .failure(let error):
                completion(NetworkingError.notFound(error: error))
            }
        }
    }
}
