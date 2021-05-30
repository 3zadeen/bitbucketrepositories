//
//  Date+Extension.swift
//  bitbucketrepositories
//
//  Created by Ezaden Seraj on 30/5/21.
//

import Foundation

extension Date {
    static func getFormattedDate(from string: String, formatter: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatter

        let toFormatter = DateFormatter()
        toFormatter.dateFormat = "MMM dd, yyyy"

        guard let date = dateFormatter.date(from: string) else {
            return nil
        }
        return toFormatter.string(from: date)
    }
}
