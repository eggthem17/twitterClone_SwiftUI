//
//  UserService.swift
//  twitterClone_SwiftUI
//
//  Created by Martin.Q on 2022/12/05.
//

import Firebase
import FirebaseFirestoreSwift

struct UserService {
	func fetchUser(withUid uid: String, completion: @escaping(User) -> Void) {
		Firestore.firestore().collection("users").document(uid).getDocument { snapshot, _ in
			guard let snapshot = snapshot else {
				return
			}
			
			guard let user = try? snapshot.data(as: User.self) else {
				return
			}
			
			completion(user)
		}
	}
}
