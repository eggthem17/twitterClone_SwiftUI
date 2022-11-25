//
//  ProfilePhotoSelectorView.swift
//  twitterClone_SwiftUI
//
//  Created by Martin.Q on 2022/11/25.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    var body: some View {
		VStack {
			AuthHeaderView(upperTitle: "Create your account", lowerTitle: "Add a profile photo")
			
			Button {
				print("image picker")
			} label: {
				Image(systemName: "plus.square.dashed")
					.resizable()
					.frame(width: 180, height: 180)
					.padding(.top, 50)
			}

			
			Spacer()
			
		}
		.ignoresSafeArea()
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
