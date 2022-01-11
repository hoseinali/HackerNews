//
//  StoryListViewModel.swift
//  HackerNews
//
//  Created by Hossein Ali Alborzi on 1/7/22.
//

import Foundation
import Combine

class StoryListViewModel: ViewModelBase {
    
    @Published var stories = [StoryViewModel]()
    private var cancellable: AnyCancellable?
    
     func fetchTopStories() {
         loadingSate = .loading
        self.cancellable = Webservice().getAllTopStories().map { stories in
            stories.map { StoryViewModel(story: $0) }
        }.sink(receiveCompletion: { _ in }, receiveValue: { storyViewModels in
            self.loadingSate = .success
            self.stories = storyViewModels
        })
    }
}

struct StoryViewModel {
    
    let story: Story
    
    var id: Int {
        return self.story.id
    }
    
    var title: String {
        return self.story.title
    }
    
    var url: String {
        return self.story.url
    }
    
}
