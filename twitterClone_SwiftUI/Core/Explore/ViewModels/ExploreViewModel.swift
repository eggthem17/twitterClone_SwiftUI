//
//  ExploreViewModel.swift
//  twitterClone_SwiftUI
//
//  Created by Martin.Q on 2022/12/05.
//

import Foundation

class ExploreViewModel: ObservableObject {
	@Published var users = [User]()
	@Published var searchText = ""
	
	var searchableUsers: [User] {
		if searchText.isEmpty {
			return users
		} else {
			let lowercasedQuery = searchText.lowercased()
			
			return users.filter({
				$0.username.contains(lowercasedQuery) || $0.fullname.lowercased().contains(lowercasedQuery)
			})
		}
	}
	
	let service = UserService()
	
	init() {
		fetchUsers()
	}
	
	func fetchUsers() {
		service.fetchUsers { users in
			self.users = users
		}
	}
}
