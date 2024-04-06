//
//  NewTaskVM.swift
//  Tasker
//
//  Created by Prateek Sujaina on 06/04/24.
//

import Foundation

/// VM layer for NewTaskView
protocol NewTaskVM {
    func addNewTask(title: String, description: String)
}
