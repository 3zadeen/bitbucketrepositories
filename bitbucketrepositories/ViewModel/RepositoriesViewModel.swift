//
//  RepositoriesViewModel.swift
//  bitbucketrepositories
//
//  Created by Ezaden Seraj on 30/5/21.
//

import Foundation

class RepositoriesViewModel {

    let provider: RepositoriesProvider
    
    init(with provider: RepositoriesProvider) {
        self.provider = provider
    }
}
