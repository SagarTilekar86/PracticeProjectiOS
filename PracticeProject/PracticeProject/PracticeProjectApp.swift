//
//  PracticeProjectApp.swift
//  PracticeProject
//
//  
//

import SwiftUI

@main
struct PracticeProjectApp: App {
    var body: some Scene {
        WindowGroup {
            makeContentView()
        }
    }
    
    func makeContentView() -> ContentView{
        let session = URLSession.shared
        let serviceManager = ServiceManager(session: session)
        let viewModel = UsersViewModel(service: serviceManager)
        return ContentView(viewModel: viewModel)
    }
}
