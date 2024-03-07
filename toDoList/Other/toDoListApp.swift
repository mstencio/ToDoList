//
//  toDoListApp.swift
//  toDoList
//
//  Created by Mau on 26/2/24.
//
import FirebaseCore
import SwiftUI

@main
struct toDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
