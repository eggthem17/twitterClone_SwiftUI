//
//  ProfilePhotoSelectorView.swift
//  twitterClone_SwiftUI
//
//  Created by Martin.Q on 2022/11/25.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
	@State private var showImagePicker = false
	@State private var selectedImage: UIImage?
	@State private var profileImage: Image?
	
	@EnvironmentObject var viewModel: AuthViewModel
	
	@Environment(\.dismiss) var dismiss
	
    var body: some View {
		VStack {
			AuthHeaderView(upperTitle: "Setup account", lowerTitle: "Add a profile photo")
			
			Button {
				showImagePicker.toggle()
			} label: {
				if let profileImage = profileImage {
					profileImage
						.resizable()
						.modifier(ProfileImageModifier())
						.clipShape(Circle())
				} else {
					Image(systemName: "plus.square.dashed")
						.resizable()
						.modifier(ProfileImageModifier())
				}
			}
			.sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
				ImagePicker(selectedImage: $selectedImage)
			}
			.padding(.top, 50)
			
			if let selectedImage = selectedImage {
				Button {
					viewModel.uploadProfileImage(selectedImage)
					dismiss()
				} label: {
					Text("Continue")
						.font(.headline)
						.foregroundColor(.white)
						.frame(width: 340, height: 50)
						.background(Color(.systemBlue))
						.clipShape(Capsule())
						.padding()
				}

			}
			
			Spacer()
			
		}
		.ignoresSafeArea()
    }
	
	func loadImage() {
		guard let selectedImage = selectedImage else {
			return
		}
		profileImage = Image(uiImage: selectedImage)
	}
}

private struct ProfileImageModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.frame(width: 180, height: 180)
			.scaledToFill()
	}
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
