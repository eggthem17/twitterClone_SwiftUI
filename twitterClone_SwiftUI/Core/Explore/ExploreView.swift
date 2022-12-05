//
//  ExploreView.swift
//  twitterClone_SwiftUI
//
//  Created by Martin.Q on 2022/10/28.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
		VStack {
			ScrollView {
				LazyVStack {
					ForEach(0 ... 25, id: \.self) { _ in
						NavigationLink {
//								ProfileView(user: <#T##User#>)
						} label: {
							UserRowView()
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
