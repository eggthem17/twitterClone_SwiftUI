//
//  TweetRowView.swift
//  twitterClone_SwiftUI
//
//  Created by Martin.Q on 2022/10/28.
//

import SwiftUI
import Kingfisher

struct TweetRowView: View {
	@ObservedObject var viewModel: TweetRowViewModel
	
	init(tweet: Tweet) {
		self.viewModel = TweetRowViewModel(tweet: tweet)
	}
	
	
    var body: some View {
		VStack(alignment: .leading) {
			//profile image & user info & tweet
			if let user = viewModel.tweet.user {
				HStack(alignment: .top, spacing: 12) {
					KFImage(URL(string: user.profileImageUrl))
						.resizable()
						.scaledToFill()
						.clipShape(Circle())
						.frame(width: 56, height: 56)
					
					//user info & tweet caption
					VStack(alignment: .leading, spacing: 4) {
						//user info
						HStack {
							Text(user.fullname)
								.font(.subheadline).bold()
							
							Group {
								Text("@\(user.username)")
								
								Text("2d")
							}
							.foregroundColor(.gray)
							.font(.caption)
						}
						
						//tweet caption
						Text(viewModel.tweet.caption)
							.font(.subheadline)
							.multilineTextAlignment(.leading)
					}
				}
			}
			
			//action buttons
			HStack {
				Button {
					// action
				} label: {
					Image(systemName: "bubble.left")
				}
				
				Spacer()
				
				Button {
					// action
				} label: {
					Image(systemName: "arrow.2.squarepath")
				}
				
				Spacer()
				
				Button {
					viewModel.tweet.didLike ?? false ? viewModel.unlikeTweet() : viewModel.likeTweet()
				} label: {
					Image(systemName: viewModel.tweet.didLike ?? false ? "heart.fill" : "heart")
						.foregroundColor(viewModel.tweet.didLike ?? false ? .red : .gray)
				}
				
				Spacer()
				
				Button {
					// action
				} label: {
					Image(systemName: "bookmark")
				}
			}
			.font(.subheadline)
			.padding()
			.foregroundColor(.gray)
			
			Divider()
		}
    }
}

//struct TweetRowView_Previews: PreviewProvider {
//    static var previews: some View {
//		TweetRowView()
//    }
//}
