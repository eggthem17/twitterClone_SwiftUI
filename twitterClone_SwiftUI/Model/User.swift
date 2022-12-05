//
//  User.swift
//  twitterClone_SwiftUI
//
//  Created by Martin.Q on 2022/12/05.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Codable {
	@DocumentID var id: String?
	let username: String
	let fullname: String
	let profileImageUrl: String
	let email: String
}
