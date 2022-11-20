//
//  RoundedShape.swift
//  twitterClone_SwiftUI
//
//  Created by Martin.Q on 2022/11/19.
//

import SwiftUI

struct RoundedShape: Shape {
	var corners: UIRectCorner
	
	func path(in rect: CGRect) -> Path {
		let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: 80, height: 80))
		
		return Path(path.cgPath)
	}
}
