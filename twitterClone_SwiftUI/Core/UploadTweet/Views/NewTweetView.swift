//
//  NewTweetView.swift
//  twitterClone_SwiftUI
//
//  Created by Martin.Q on 2022/11/18.
//

import SwiftUI

struct NewTweetView: View {
	@State private var caption = ""
	@Environment(\.dismiss) var dismiss
	
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
					print("tweet")
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
				Circle()
					.frame(width: 64, height: 64)
				
				TextArea("What's happening?", text: $caption)
			}
			.padding()
		}
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}
