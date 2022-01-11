//
//  StoryDetailViewModel.swift
//  HackerNews
//
//  Created by Hossein Ali Alborzi on 1/7/22.
//

import Foundation
import Combine

class StoryDetailViewModel: ViewModelBase {
    
    private var cancellable: AnyCancellable?
    
    @Published var story = Story.placeholder()
    
    func fetchStoryDetails(storyId: Int) {
         print("about to make a network request")
        loadingSate = .loading
        self.cancellable = Webservice().getStoryById(storyId: storyId)
                  .catch { _ in Just(Story.placeholder()) }
                  .sink(receiveCompletion: { _ in }, receiveValue: { story in
                      self.loadingSate = .success
                      self.story = story
        })
    }
}

extension StoryDetailViewModel {
    
    var title: String {
        
        return self.story.title
    }
    
    var url: String {
        return self.story.url
    }
    
}
