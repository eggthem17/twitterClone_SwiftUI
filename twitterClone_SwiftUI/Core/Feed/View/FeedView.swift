//
//  FeedView.swift
//  twitterClone_SwiftUI
//
//  Created by Martin.Q on 2022/10/28.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
		ZStack(alignment: .bottomTrailing) {
			ScrollView {
				LazyVStack {
					ForEach(0 ... 20, id: \.self) { _ in
						TweetRowView()
							.padding()
					}
				}
			}
			
			Button {
				print("this is Floating Button Function")
			} label: {
				Image("tweet")
					.resizable()
					.renderingMode(.template)
					.frame(width: 28, height: 28)
					.padding()
			}
			.background(Color(.systemBlue))
			.foregroundColor(.white)
			.clipShape(Circle())
			.padding()
		}
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
