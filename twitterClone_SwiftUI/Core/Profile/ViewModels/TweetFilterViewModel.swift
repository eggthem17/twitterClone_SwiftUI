//
//  TweetFilterViewModel.swift
//  twitterClone_SwiftUI
//
//  Created by Martin.Q on 2022/11/10.
//

import Foundation

enum TweetFilterViewModel: Int, CaseIterable {
	case tweets
	case replies
	case likes
	
	var title: String {
		switch self {
		case .tweets: return "Tweets"
		case .replies: return "Replies"
		case .likes: return "Likes"
		}
	}
}
