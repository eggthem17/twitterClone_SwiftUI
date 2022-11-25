//
//  AuthViewModel.swift
//  twitterClone_SwiftUI
//
//  Created by Martin.Q on 2022/11/25.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
	@Published var userSession: FirebaseAuth.User?
	
	init() {
		self.userSession = Auth.auth().currentUser
		
		print("debug: user session is \(self.userSession?.uid)")
	}
	
	func login(withEmail email: String, password: String) {
		Auth.auth().signIn(withEmail: email, password: password) { result, error in
			if let error = error {
				print("debug: failed to signin \(error.localizedDescription)")
				return
			}
			
			guard let user = result?.user else {
				return
			}
			self.userSession = user
			print("debug: did log user in")
		}
	}
	
	func register(withEmail email: String, password: String, fullname: String, username: String) {
		Auth.auth().createUser(withEmail: email, password: password) { result, error in
			if let error = error {
				print("debug: failed to register \(error.localizedDescription)")
				return
			}
			
			guard let user = result?.user else {
				return
			}
			self.userSession = user
			
			print("debug: registration successful")
			print("debug: user is \(self.userSession)")
			
			let data = ["email": email,
						"username": username.lowercased(),
						"fullname": fullname,
						"uid": user.uid]
			
			Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
				print("debug: did upload user data")
			}
		}
	}
	
	func signOut() {
		userSession = nil
		try? Auth.auth().signOut()
	}
}
