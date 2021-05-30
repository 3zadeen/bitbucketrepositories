//
//  bitbucketrepositoriesTests.swift
//  bitbucketrepositoriesTests
//
//  Created by Ezaden Seraj on 30/5/21.
//

import XCTest
@testable import bitbucketrepositories

class RepositoriesListTests: XCTestCase {

    func testSuccessAPIResponse() {
        let provider = RepositoriesProvider(with: APIService())
        
        let expectation = XCTestExpectation(description: "HTTP response with a 200 response code")
        
        provider.getRepositories { [weak self] result in
            guard let _ = self else {return}
            
            switch result {
            case .success(let repositories):
                XCTAssertNotNil(repositories.repositories, "Data successfully fetched")
            case .failure(let error):
                XCTFail("Request was not successful: \(error.localizedDescription)")
            }
            
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 30)
    }
    
    func testNextPageAPIResponse() {
        let provider = RepositoriesProvider(with: APIService())
        
        let expectation = XCTestExpectation(description: "HTTP response expected to fail")
        
        provider.getNexPage(from: "https://www.apple.com") { [weak self] result in
            guard let _ = self else {return}
            switch result {
            case .success(_):
                XCTFail("Request did not fail when it was expected to.")
            case .failure(let error):
                XCTAssertNotNil(error.localizedDescription, "API response failed")
            }
            
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 30)
    }
}
