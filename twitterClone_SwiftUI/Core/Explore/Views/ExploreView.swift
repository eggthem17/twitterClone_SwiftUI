//
//  ExploreView.swift
//  twitterClone_SwiftUI
//
//  Created by Martin.Q on 2022/10/28.
//

import SwiftUI

struct ExploreView: View {
	@ObservedObject var viewModel = ExploreViewModel()
	
    var body: some View {
		VStack {
			ScrollView {
				LazyVStack {
					ForEach(viewModel.users) { user in
						NavigationLink {
							ProfileView(user: user)
						} label: {
							UserRowView(user: user)
						}

					}
				}
			}
		}
		.navigationTitle("Explore")
		.navigationBarTitleDisplayMode(.inline)
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}