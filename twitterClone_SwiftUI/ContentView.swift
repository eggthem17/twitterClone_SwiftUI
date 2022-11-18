//
//  ContentView.swift
//  twitterClone_SwiftUI
//
//  Created by Martin.Q on 2022/10/28.
//

import SwiftUI

struct ContentView: View {
	@State private var showMenu = false
    var body: some View {
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
//				.background(showMenu ? Color.white : Color.clear)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
