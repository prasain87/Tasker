//
//  TaskerApp.swift
//  Tasker
//
//  Created by Prateek Sujaina on 14/03/24.
//

import SwiftUI

@main
struct TaskerApp: App {
    let model: TaskModel = TaskModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(model: model)
        }
    }
}
