//
//  TodoApp.swift
//  Todo
//
//  Created by Shubham kumar on 07/07/25.
//

import SwiftUI

@main
struct TodoApp: App {
  @StateObject  var listViewModel: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }.navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
