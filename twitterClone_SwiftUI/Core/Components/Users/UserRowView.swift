//
//  UserRowView.swift
//  twitterClone_SwiftUI
//
//  Created by Martin.Q on 2022/11/11.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
		HStack(spacing: 12) {
			Circle()
				.frame(width: 45, height: 45)
			
			VStack(alignment: .leading, spacing: 4) {
				Text("user1")
					.font(.subheadline).bold()
					.foregroundColor(.black)
				
				Text("almost admin")
					.font(.subheadline)
					.foregroundColor(.gray)
			}
			
			Spacer()
		}
		.padding(.horizontal)
		.padding(.vertical, 4)
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView()
    }
}
