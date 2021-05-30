//
//  URL+Extension.swift
//  bitbucketrepositories
//
//  Created by Ezaden Seraj on 30/5/21.
//

import Foundation

extension URL {
    func valueOf(_ queryParamName: String) -> String? {
        guard let url = URLComponents(string: self.absoluteString) else { return nil }
        return url.queryItems?.first(where: { $0.name == queryParamName })?.value
    }
}
