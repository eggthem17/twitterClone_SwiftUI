//
//  ImageUploader.swift
//  twitterClone_SwiftUI
//
//  Created by Martin.Q on 2022/11/25.
//

import FirebaseStorage
import UIKit

struct ImageUploader {
	static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
		guard let imageData = image.jpegData(compressionQuality: 0.5) else {
			return
		}
		
		let filename = UUID().uuidString
		let ref = Storage.storage().reference(withPath: "/profile_image/\(filename)")
		
		ref.putData(imageData) { _, error in
			if let error = error {
				print("debug: failed to upload image with \(error.localizedDescription)")
				return
			}
			
			ref.downloadURL { imageUrl, error in
				guard let imageUrl = imageUrl?.absoluteString else { return }
				completion(imageUrl)
			}
		}
	}
}
