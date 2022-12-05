//
//  ExploreViewModel.swift
//  twitterClone_SwiftUI
//
//  Created by Martin.Q on 2022/12/05.
//

import Foundation

class ExploreViewModel: ObservableObject {
	@Published var users = [User]()
	let service = UserService()
	
	init() {
		fetchUsers()
	}
	
	func fetchUsers() {
		service.fetchUsers { users in
			self.users = users
			
			print("Users are \(users)")
		}
	}
}
