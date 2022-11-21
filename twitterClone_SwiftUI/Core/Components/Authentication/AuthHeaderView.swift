//
//  AuthHeaderView.swift
//  twitterClone_SwiftUI
//
//  Created by Martin.Q on 2022/11/20.
//

import SwiftUI

struct AuthHeaderView: View {
	let upperTitle: String
	let lowerTitle: String
	
    var body: some View {
		VStack(alignment: .leading) {
			HStack {
				Spacer()
			}
			
			Group {
				Text(upperTitle)
				
				Text(lowerTitle)
			}
			.font(.largeTitle)
			.fontWeight(.semibold)
		}
		.frame(height: 260)
		.padding(.leading)
		.background(Color(.systemBlue))
		.foregroundColor(.white)
		.clipShape(RoundedShape(corners: .bottomRight))
    }
}

struct AuthHeaderView_Previews: PreviewProvider {
    static var previews: some View {
		AuthHeaderView(upperTitle: "upper", lowerTitle: "lower")
    }
}
