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
		
		print("debug: user session is \(self.userSession)")
	}
	
	func login(withEmail email: String, password: String) {
		print("debug: login with email \(email)")
	}
	
	func register(withEmail email: String, password: String, fullname: String, username: String) {
		print("debug: register with email \(email)")
	}
}
