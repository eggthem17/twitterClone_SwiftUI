//
//  FeedViewModel.swift
//  twitterClone_SwiftUI
//
//  Created by Martin.Q on 2022/12/05.
//

import Foundation

class FeedViewModel: ObservableObject {
	@Published var tweets = [Tweet]()
	let service = TweetService()
	
	init() {
		fetchTweets()
	}
	
	func fetchTweets() {
		service.fetchTweets { tweets in
			self.tweets = tweets
		}
	}
}
