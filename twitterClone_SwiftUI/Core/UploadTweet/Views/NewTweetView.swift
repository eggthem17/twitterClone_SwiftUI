//
//  NewTweetView.swift
//  twitterClone_SwiftUI
//
//  Created by Martin.Q on 2022/11/18.
//

import SwiftUI
import Kingfisher

struct NewTweetView: View {
	@State private var caption = ""
	@Environment(\.dismiss) var dismiss
	@EnvironmentObject var authViewModel: AuthViewModel
	@ObservedObject var viewModel = UploadTweetViewModel()
	
    var body: some View {
		VStack {
			HStack {
				Button {
					dismiss()
				} label: {
					Text("Cancel")
						.foregroundColor(Color(.systemBlue))
				}
				
				Spacer()
				
				Button {
					viewModel.uploadTweet(withCaption: caption)
				} label: {
					Text("Tweet")
						.bold()
						.foregroundColor(.white)
						.padding(.horizontal)
						.padding(.vertical, 8)
						.background(Color(.systemBlue))
						.clipShape(Capsule())
				}
			}
			.padding()
			
			HStack(alignment: .top) {
				if let user = authViewModel.currentUser {
					KFImage(URL(string: user.profileImageUrl))
						.resizable()
						.scaledToFill()
						.clipShape(Circle())
						.frame(width: 64, height: 64)
				}
				
				TextArea("What's happening?", text: $caption)
			}
			.padding()
		}
		.onReceive(viewModel.$didUploadTweet) { result in
			if result {
				dismiss()
			}
		}
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}
