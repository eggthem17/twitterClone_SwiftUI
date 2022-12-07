//
//  User.swift
//  twitterClone_SwiftUI
//
//  Created by Martin.Q on 2022/12/05.
//

import FirebaseFirestoreSwift
import Firebase

struct User: Identifiable, Codable {
	@DocumentID var id: String?
	let username: String
	let fullname: String
	let profileImageUrl: String
	let email: String
	
	var isCurrentUser: Bool {
		return Auth.auth().currentUser?.uid == id
	}
}
