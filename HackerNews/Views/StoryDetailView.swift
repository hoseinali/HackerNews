//
//  StoryDetailView.swift
//  HackerNews
//
//  Created by Hossein Ali Alborzi on 1/8/22.
//

import SwiftUI

struct StoryDetailView: View {
    @ObservedObject private var storyDetailVM: StoryDetailViewModel
    var storyId: Int
    let progressView =             ProgressView("Please wait...")

    init(storyId: Int) {
        self.storyId = storyId
        self.storyDetailVM = StoryDetailViewModel()
    }
    
    var body: some View {
        VStack {
            if storyDetailVM.loadingSate == .loading {
                ProgressView("Please wait...")
            } else if storyDetailVM.loadingSate == .success {
                Text(self.storyDetailVM.title)
                    .foregroundColor(.gray)
                Webview(url: self.storyDetailVM.url)
            }
        }.onAppear {
            self.storyDetailVM.fetchStoryDetails(storyId: self.storyId)
        }
    }
}

struct StoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoryDetailView(storyId: 100)
    }
}
