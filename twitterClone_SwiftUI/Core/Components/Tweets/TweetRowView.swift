//
//  TweetRowView.swift
//  twitterClone_SwiftUI
//
//  Created by Martin.Q on 2022/10/28.
//

import SwiftUI

struct TweetRowView: View {
    var body: some View {
		VStack(alignment: .leading) {
			//profile image & user info & tweet
			HStack(alignment: .top, spacing: 12) {
				Circle()
					.frame(width: 56, height: 56)
					.foregroundColor(Color(.systemBlue))
				
				//user info & tweet caption
				VStack(alignment: .leading, spacing: 4) {
					//user info
					HStack {
						Text("Marcus")
							.font(.subheadline).bold()
						
						Text("@philosophy")
							.foregroundColor(.gray)
							.font(.caption)
						
						Text("2d")
							.foregroundColor(.gray)
							.font(.caption)
					}
					
					//tweet caption
					Text("Who burned my beard?!")
						.font(.subheadline)
						.multilineTextAlignment(.leading)
				}
			}
			
			//action buttons
			HStack {
				Button {
					// action
				} label: {
					Image(systemName: "bubble.left")
						.font(.subheadline)
				}
				
				Spacer()
				
				Button {
					// action
				} label: {
					Image(systemName: "arrow.2.squarepath")
						.font(.subheadline)
				}
				
				Spacer()
				
				Button {
					// action
				} label: {
					Image(systemName: "heart")
						.font(.subheadline)
				}
				
				Spacer()
				
				Button {
					// action
				} label: {
					Image(systemName: "bookmark")
						.font(.subheadline)
				}
			}
			.padding()
			.foregroundColor(.gray)
			
			Divider()
		}
    }
}

struct TweetRowView_Previews: PreviewProvider {
    static var previews: some View {
		TweetRowView()
    }
}
