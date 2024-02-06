//
//  ContentView.swift
//  GitHub_V2_Test
//
//  Created by jointree on 2024/02/05.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = UserViewModel()

    var body: some View {
        NavigationView {
            VStack {
                TextField("Search GitHub Users...", text: $viewModel.searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("Search") {
                    viewModel.isSearchCompleted = false
                    viewModel.searchUser()
                }
                                
                if viewModel.isSearchCompleted, let user = viewModel.userResponse?.items.first {
                    NavigationLink(destination: UserView(user: user), isActive: $viewModel.isSearchCompleted) {
                        EmptyView()
                    }
                }
            }
            .padding()
            .navigationBarTitle("GitHub User Search")
        }
    }
}
