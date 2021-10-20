//
//  ContentView.swift
//  PracticeProject
//
//  
//
/*
 **Note This code is develop on Xcode 12.4 not on Xcode 13 so their will some UI deviation on iOS 14.4+
 */

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: UsersViewModel
    @State var selectedUserId: Int?
    @State var selectedUserName: String?
    
    init(viewModel: UsersViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Group {
                    if let selectedUserId = selectedUserId,
                       let selectedUserName = selectedUserName {
                        VStack(alignment: .leading) {
                            Text("Name: \(selectedUserName)")
                            Divider()
                            Text("Id: \(selectedUserId)")
                        }.padding()
                    }
                }) {
                    ForEach(viewModel.usersList) { userslist in
                        VStack(alignment: .leading, spacing: 5.0) {
                            Text("Id : \(userslist.id)")
                            Text("Name : \(userslist.name)")
                            Text("Email : \(userslist.email)")
                            Text("Company : \(userslist.company.name)")
                            Text("City : \(userslist.address.city)")
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 5.0)
                        .overlay(
                            Rectangle()
                                .stroke(Color.gray)
                        )
                        .onTapGesture {
                            self.selectedUserId = userslist.id
                            self.selectedUserName = userslist.name
                            viewModel.fetchUsers(excludingUserWithID: String(userslist.id))
                        }
                    }
                }
                
                
            }
            .listStyle(PlainListStyle())
            .alert(isPresented: $viewModel.isErrorMessageVisible, content: { () -> Alert in
                Alert(title: Text("Error"), message: Text(viewModel.errorMessage), dismissButton: .cancel())
            })
            .onAppear(){
                viewModel.fetchUsers(excludingUserWithID: nil)
            }
            .navigationTitle(Text("Users List"))
        }
    }
    
}
