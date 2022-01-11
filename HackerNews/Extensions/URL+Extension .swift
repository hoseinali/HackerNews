//
//  URL+Extension .swift
//  HackerNews
//
//  Created by Hossein Ali Alborzi on 1/7/22.
//

import Foundation

extension URL {
    static func getAllTopStories() -> URL? {
        return URL(string: "https://hacker-news.firebaseio.com/v0/askstories.json?print=pretty")
    }

    static func getStoryById(storyId: Int) -> URL? {
        return URL(string: "https://hacker-news.firebaseio.com/v0/item/\(storyId).json?print=pretty")
    }
    
}
