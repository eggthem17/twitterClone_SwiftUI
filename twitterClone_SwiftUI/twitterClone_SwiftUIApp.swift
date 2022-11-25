//
//  twitterClone_SwiftUIApp.swift
//  twitterClone_SwiftUI
//
//  Created by Martin.Q on 2022/10/28.
//

import SwiftUI
import Firebase

@main
struct twitterClone_SwiftUIApp: App {
	@StateObject var viewModel = AuthViewModel()
	
	init() {
		FirebaseApp.configure()
	}
	
    var body: some Scene {
        WindowGroup {
			NavigationStack {
//				ContentView()
				ProfilePhotoSelectorView()
			}
			.environmentObject(viewModel)
			.toolbarBackground(.visible, for: .navigationBar)
        }
    }
}
