//
//  Tweet.swift
//  twitterClone_SwiftUI
//
//  Created by Martin.Q on 2022/12/05.
//

import FirebaseFirestoreSwift
import Firebase

struct Tweet: Identifiable, Codable {
	@DocumentID var id: String?
	let caption: String
	let timestamp: Timestamp
	let uid: String
	var likes: Int
	
	var user: User?
}
