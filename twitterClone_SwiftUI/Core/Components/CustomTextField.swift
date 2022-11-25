//
//  CustomTextField.swift
//  twitterClone_SwiftUI
//
//  Created by Martin.Q on 2022/11/20.
//

import SwiftUI

struct CustomTextField: View {
	let imageName: String
	let placeholderText: String
	let fieldType: FieldType
	
	@Binding var text: String
	
	enum FieldType {
		case normal
		case secure
	}
	
    var body: some View {
		VStack {
			HStack {
				Image(systemName: imageName)
					.resizable()
					.scaledToFit()
					.frame(width: 20, height: 20)
					.foregroundColor(Color(.darkGray))
				
				if fieldType == .secure {
					SecureField(placeholderText, text: $text)
				} else {
					TextField(placeholderText, text: $text)
				}
			}
			
			Divider()
				.background(Color(.darkGray))
		}
    }
}

struct CustomIDField_Previews: PreviewProvider {
    static var previews: some View {
		CustomTextField(imageName: "envelope", placeholderText: "Placeholder", fieldType: .normal, text: .constant(""))
    }
}
