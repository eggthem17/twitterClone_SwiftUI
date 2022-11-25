//
//  RegistrationView.swift
//  twitterClone_SwiftUI
//
//  Created by Martin.Q on 2022/11/19.
//

import SwiftUI

struct RegistrationView: View {
	@Environment(\.dismiss) var dismiss
	
	@EnvironmentObject var viewModel: AuthViewModel
	
	@State private var email = ""
	@State private var password = ""
	@State private var userName = ""
	@State private var fullName = ""
	
    var body: some View {
		VStack {
			AuthHeaderView(upperTitle: "Get started.", lowerTitle: "Create your account")
			
			VStack(spacing: 40) {
				CustomTextField(imageName: "envelope", placeholderText: "Email", fieldType: .normal, text: $email)
				
				CustomTextField(imageName: "person", placeholderText: "UserName", fieldType: .normal, text: $userName)
				
				CustomTextField(imageName: "person", placeholderText: "FullName", fieldType: .normal, text: $fullName)
				
				CustomTextField(imageName: "lock", placeholderText: "Password", fieldType: .normal, text: $password)
			}
			.padding(32)
			
			Button {
				viewModel.register(withEmail: email, password: password, fullname: fullName, username: userName)
				dismiss()
			} label: {
				Text("Sign Up")
					.font(.headline)
					.foregroundColor(.white)
					.frame(width: 340, height: 50)
					.background(Color(.systemBlue))
					.clipShape(Capsule())
					.padding()
			}
			.shadow(color: .gray.opacity(0.5), radius: 10)
			
			Spacer()
			
			Button {
				dismiss()
			} label: {
				HStack {
					Text("Already have an account?")
					
					Text("Sign In")
						.fontWeight(.semibold)
				}
				.foregroundColor(Color(.systemBlue))
				.font(.footnote)
			}
			.padding(32)
		}
		.ignoresSafeArea()
		.toolbar(.hidden)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
