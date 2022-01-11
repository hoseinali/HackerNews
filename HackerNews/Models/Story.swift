//
//  Story.swift
//  HackerNews
//
//  Created by Hossein Ali Alborzi on 1/7/22.
//

import Foundation

struct Story: Codable {
    let id: Int
    let title: String
    let url: String
}

extension Story {
    static func placeholder() -> Story {
        return Story(id: 0, title: "N/A", url: "")
    }
}

