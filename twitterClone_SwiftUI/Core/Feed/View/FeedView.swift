//
//  FeedView.swift
//  twitterClone_SwiftUI
//
//  Created by Martin.Q on 2022/10/28.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
		ScrollView {
			LazyVStack {
				ForEach(0 ... 20, id: \.self) { _ in
					TweetRowView()
						.padding()
				}
			}
		}
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
