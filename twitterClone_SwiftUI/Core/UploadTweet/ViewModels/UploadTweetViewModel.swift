//
//  UploadTweetViewModel.swift
//  twitterClone_SwiftUI
//
//  Created by Martin.Q on 2022/12/05.
//

import Foundation

class UploadTweetViewModel: ObservableObject {
	@Published var didUploadTweet = false
	let service = TweetService()
	
	func uploadTweet(withCaption caption: String) {
		service.uploadTweet(caption: caption) { result in
			if result {
				self.didUploadTweet = true
			} else {
				//show error
			}
		}
	}
}
