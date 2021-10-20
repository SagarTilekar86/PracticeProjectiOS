//
//  UsersViewModel.swift
//  PracticeProject
//
//  Created by Sagar Tilekar on 19/10/21.
//

import Foundation

class UsersViewModel: ObservableObject {
    
    private let service: API
    @Published var usersList: [UsersListElement] = []
    @Published var errorMessage: String = ""
    @Published var isErrorMessageVisible = false
    
    init(service: API) {
        self.service = service
    }
    
    func fetchUsers(excludingUserWithID: String?) {
        
        service.fetchUsers(
            excludingUserWithID: excludingUserWithID,
            success: { [weak self] users in
                DispatchQueue.main.async {
                    self?.usersList = users
                    if let excludingUserWithID = excludingUserWithID,
                       let index = self?.findIndex(Id: Int(excludingUserWithID) ?? 0) {
                        self?.usersList.remove(at: index)
                    }
                    self?.usersList.reverse()
                    self?.errorMessage = ""
                    self?.isErrorMessageVisible = false
                }
                
            },
            failure: { [weak self] error in
                DispatchQueue.main.async {
                    self?.errorMessage = error.localizedDescription
                    self?.isErrorMessageVisible = true
                }
                
            })
    }
    
    //getting index from arraylist
    private func findIndex(Id: Int) -> Int? {
        return usersList.firstIndex { $0.id == Id }
    }
}
