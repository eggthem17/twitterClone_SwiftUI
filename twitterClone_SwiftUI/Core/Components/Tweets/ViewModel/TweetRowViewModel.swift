//
//  TweetRowViewModel.swift
//  twitterClone_SwiftUI
//
//  Created by Martin.Q on 2022/12/06.
//

import Foundation

class TweetRowViewModel: ObservableObject {
	private let service = TweetService()
	@Published var tweet: Tweet
	
	init(tweet: Tweet) {
		self.tweet = tweet
	}
	
	func likeTweet() {
		service.likeTweet(tweet) {
			self.tweet.didLike = true
		}
	}
}
