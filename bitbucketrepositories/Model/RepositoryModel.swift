//
//  RepositoryModel.swift
//  bitbucketrepositories
//
//  Created by Ezaden Seraj on 30/5/21.
//

import Foundation

struct Repositories: Decodable {
    let next: String
    let repositories: [Repository]
    
    enum CodingKeys: String, CodingKey {
        case next
        case repositories = "values"
    }
}

struct Repository: Decodable, Hashable {
    let owner: Owner
    let type: String
    let createdDate: String

    enum CodingKeys: String, CodingKey {
        case type
        case owner
        case createdDate = "created_on"
    }
}

struct Owner: Decodable, Hashable {
    let displayName: String
    let links: Links

    enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
        case links
    }
}

struct Links: Codable, Hashable {
    let avatar: Avatar

    enum CodingKeys: String, CodingKey {
        case avatar
    }
}

struct Avatar: Codable, Hashable {
    let href: String

    enum CodingKeys: String, CodingKey {
        case href
    }
}

