//
//  UserStatsView.swift
//  twitterClone_SwiftUI
//
//  Created by Martin.Q on 2022/11/11.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
		HStack(spacing: 24) {
			HStack(spacing: 4) {
				Text("777")
					.font(.subheadline)
					.fontWeight(.bold)
				
				Text("Following")
					.font(.caption)
					.foregroundColor(.gray)
			}
			
			HStack(spacing: 4) {
				Text("9M")
					.font(.subheadline)
					.fontWeight(.bold)
				
				Text("Followers")
					.font(.caption)
					.foregroundColor(.gray)
			}
		}
    }
}

struct UserStatsView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatsView()
    }
}
