//
//  TaskDetailsVM.swift
//  Tasker
//
//  Created by Prateek Sujaina on 06/04/24.
//

import Foundation

/// VM layer for TaskDetailsView
protocol TaskDetailsVM {
    func updateTask(id: String, title: String, description: String, status: TaskStatus)
}
