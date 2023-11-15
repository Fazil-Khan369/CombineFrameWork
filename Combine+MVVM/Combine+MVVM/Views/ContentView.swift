//
//  ContentView.swift
//  Combine+MVVM
//
//  Created by Fazil P on 06/11/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = UserViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                if viewModel.isRefreshing {
                    ProgressView()
                } else {
                    List {
                        ForEach(viewModel.users, id: \.id) { user in
                            ListView(user: user)
                                .listRowSeparator(.hidden)
                            
                        }
                    }
                    .listStyle(.plain)
                    .navigationTitle("Employee List")
                }
            }
            .onAppear(perform: viewModel.fetchUsers)
            .alert(isPresented: $viewModel.hasError, error: viewModel.error) {
                Button(action: {
                    viewModel.fetchUsers()
                }, label: {
                    Text("Retry")
                })
            }
                
            
        }
    }
}

#Preview {
    ContentView()
}
