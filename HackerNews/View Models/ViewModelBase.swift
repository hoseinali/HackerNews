//
//  ViewModelBase.swift
//  HackerNews
//
//  Created by Hossein Ali Alborzi on 1/11/22.
//  Copyright © 2022 Mohammad Azam. All rights reserved.
//

import Foundation

enum LoadingState {
    case loading
    case success
    case failed
    case none
}

class ViewModelBase: ObservableObject {
    @Published var loadingSate: LoadingState = .none
    
}
