//
//  ContentView.swift
//  twitterClone_SwiftUI
//
//  Created by Martin.Q on 2022/10/28.
//

import SwiftUI

struct ContentView: View {
	@State private var showMenu = false
	@EnvironmentObject var viewModel: AuthViewModel
	
    var body: some View {
		Group {
			//need login
			if viewModel.userSession == nil {
				LoginView()
			} else {
				//login successfuly
				mainInterfaceView
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
	var mainInterfaceView: some View {
		ZStack(alignment: .topLeading) {
			MainTabView()
				.toolbar(showMenu ? .hidden : .visible)
			
			if showMenu {
				ZStack {
					withAnimation(.easeInOut) {
						Color(.black)
							.opacity(showMenu ? 0.25 : 0.0)
					}
				}.onTapGesture {
					withAnimation(.easeInOut) {
						showMenu = false
					}
				}
				.ignoresSafeArea()
			}
			
			SideMenuView()
				.frame(width: 300)
				.offset(x: showMenu ? 0 : -300, y: 0)
		}
		.navigationTitle("Home")
		.navigationBarTitleDisplayMode(.inline)
		.toolbar{
			ToolbarItem(placement: .navigationBarLeading) {
				Button {
					withAnimation(.easeInOut) {
						showMenu.toggle()
					}
				} label: {
					Circle()
						.frame(width: 32, height: 32)
				}
			}
		}
		.onAppear {
			showMenu = false
		}
	}
}
