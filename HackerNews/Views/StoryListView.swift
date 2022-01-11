//
//  StoryListView.swift
//  HackerNews
//
//  Created by Hossein Ali Alborzi on 1/7/22.
//

import SwiftUI

struct StoryListView: View {
    
    @ObservedObject private var storyListVM = StoryListViewModel()
    
    var body: some View {
        NavigationView {
            if storyListVM.loadingSate == .success {
                List(self.storyListVM.stories, id: \.id) { storyVM in
                    NavigationLink(destination: StoryDetailView(storyId: storyVM.id)) {
                        Text(storyVM.title).foregroundColor(.gray)
                    }
                }
                .padding(.horizontal, -20)
                .navigationBarTitle("Hacker News")
            } else if storyListVM.loadingSate == .loading {               ProgressView("Please wait...")
            }
        }.onAppear {
            storyListVM.fetchTopStories()
        }
        .navigationBarColor(backgroundColor: .systemTeal, tintColor: .white)
    }
}

struct StoryListView_Previews: PreviewProvider {
    static var previews: some View {
        StoryListView()
    }
}
