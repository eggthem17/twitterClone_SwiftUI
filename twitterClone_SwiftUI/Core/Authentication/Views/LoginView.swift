//
//  LoginView.swift
//  twitterClone_SwiftUI
//
//  Created by Martin.Q on 2022/11/19.
//

import SwiftUI

struct LoginView: View {
	@State private var email = ""
	@State private var password = ""
    var body: some View {
		//parent container
		VStack {
			
			//header view
			VStack(alignment: .leading) {
				HStack {
					Spacer()
				}
				
				Group {
					Text("Hello.")
					
					Text("Welcom Back")
				}
				.font(.largeTitle)
				.fontWeight(.semibold)
			}
			.frame(height: 260)
			.padding(.leading)
			.background(Color(.systemBlue))
			.foregroundColor(.white)
			.clipShape(RoundedShape(corners: .bottomRight))
			
			VStack(spacing: 40) {
				CustomTextField(imageName: "envelope", placeholderText: "Email", fieldType: .normal, text: $email)
				
				CustomTextField(imageName: "lock", placeholderText: "Password", fieldType: .secure, text: $password)
			}
			.padding(.horizontal, 32)
			.padding(.top, 44)
			
			HStack {
				Spacer()
				
				NavigationLink {
					Text("Reset password view...")
				} label: {
					Text("Forgot Password?")
						.font(.caption)
						.fontWeight(.semibold)
						.foregroundColor(Color(.systemBlue))
						.padding(.top)
						.padding(.trailing, 24)
				}
			}
			
			Button {
				print("login function")
			} label: {
				Text("Sign In")
					.font(.headline)
					.foregroundColor(.white)
					.frame(width: 340, height: 50)
					.background(Color(.systemBlue))
					.clipShape(Capsule())
					.padding()
			}
			.shadow(color: .gray.opacity(0.5), radius: 10)
			
			Spacer()
			
			NavigationLink {
				RegistrationView()
					.toolbar(.hidden)
			} label: {
				HStack {
					Text("Don't have an account?")
					
					Text("Sign Up")
						.fontWeight(.semibold)
				}
				.foregroundColor(Color(.systemBlue))
				.font(.footnote)
			}
			.padding(.bottom, 32)

		}
		.ignoresSafeArea()
		.toolbar(.hidden)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
