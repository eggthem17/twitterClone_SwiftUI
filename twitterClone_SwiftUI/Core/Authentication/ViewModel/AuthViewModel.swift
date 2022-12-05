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
	@Published var didAuthenticateUser = false
	
	private var tempUserSession: FirebaseAuth.User?
	private let service = UserService()
	
	init() {
		self.userSession = Auth.auth().currentUser
		fetchUser()
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
			self.tempUserSession = user
			
			let data = ["email": email,
						"username": username.lowercased(),
						"fullname": fullname,
						"uid": user.uid]
			
			Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
				self.didAuthenticateUser = true
			}
		}
	}
	
	func signOut() {
		userSession = nil
		try? Auth.auth().signOut()
	}
	
	func uploadProfileImage(_ image: UIImage) {
		guard let uid = tempUserSession?.uid else {
			return
		}
		
		ImageUploader.uploadImage(image: image) { profileImageUrl in
			Firestore.firestore().collection("users").document(uid).updateData(["profileImageUrl": profileImageUrl]) { _ in
				self.userSession = self.tempUserSession
			}
		}
	}
	
	func fetchUser() {
		guard let uid = self.userSession?.uid else {
			return
		}
		
		service.fetchUser(withUid: uid)
	}
}
