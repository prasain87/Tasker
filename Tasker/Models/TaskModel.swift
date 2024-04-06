//
//  TaskModel.swift
//  Tasker
//
//  Created by Prateek Sujaina on 20/03/24.
//

import Foundation

class TaskModel: ObservableObject {
    
    @Published var taskList: [TaskItemModel] = []

    private var allTask: [TaskItemModel] = []
    private var filterApplied: TaskFilterType = .all
    
    init() {
        self.allTask = [
            TaskItemModel(title: "Task 1", desc: "Dynamic Programming is mainly an optimization over plain recursion. Wherever we see a recursive solution that has repeated calls for the same inputs, we can optimize it using Dynamic Programming. The idea is to simply store the results of subproblems so that we do not have to re-compute them when needed later. This simple optimization reduces time complexities from exponential to polynomial.", status: .todo),
            TaskItemModel(title: "Task 2", desc: "Dynamic Programming (DP) is defined as a technique that solves some particular type of problems in Polynomial Time.", status: .inProgress),
            TaskItemModel(title: "Task 3", desc: "Dynamic Programming (DP) is defined as a technique that solves.", status: .todo),
            TaskItemModel(title: "Task 4", desc: "Dynamic Programming (DP) is defined as a technique that solves some particular type of problems in Polynomial Time.", status: .done),
            TaskItemModel(title: "Task 5", desc: "Dynamic Programming is mainly an optimization over plain recursion. Wherever we see a recursive solution that has repeated calls for the same inputs, we can optimize it using Dynamic Programming. The idea is to simply store the results of subproblems so that we do not have to re-compute them when needed later. This simple optimization reduces time complexities from exponential to polynomial.", status: .todo),
            TaskItemModel(title: "Task 6", desc: "Dynamic Programming (DP) is defined as a technique that solves some particular type of problems in Polynomial Time.", status: .inProgress),
            TaskItemModel(title: "Task 7", desc: "Dynamic Programming (DP) is defined as a technique that solves.", status: .todo),
            TaskItemModel(title: "Task 8", desc: "Dynamic Programming (DP) is defined as a technique that solves some particular type of problems in Polynomial Time.", status: .done)
        ]
        taskList = allTask
//        if let menuJSON = decodeJSON(data: data){
//            taskList = menuJSON.tasks
//        }
    }
    
    func decodeJSON(data:Data!)-> TaskData! {
        var menu: TaskData! = nil
        let decoder = JSONDecoder()
        do {
            try menu = decoder.decode(TaskData.self, from: data)
        } catch let err as DecodingError {
            print("Decoding Error: \(err.localizedDescription)")
        } catch let error as NSError {
            print("Error reading JSON file: \(error.localizedDescription)")
        }
        return menu
    }
    
    func delete(at offsets: IndexSet) {
        let taskIdSet = Set<String>(offsets.map({ taskList[$0].id }))
        allTask.removeAll(where: { taskIdSet.contains($0.id) })
        updateFilteredList()
    }
    
    func applyFilter(status: TaskFilterType) {
        filterApplied = status
        updateFilteredList()
    }
    
    private func updateFilteredList() {
        taskList = allTask.filter({ filterApplied.taskStatus.contains($0.status) })
    }
}

extension TaskModel: NewTaskVM {
    func addNewTask(title: String, description: String) {
        guard !title.isEmpty && !description.isEmpty else {
            return
        }
        let task = TaskItemModel(title: title, desc: description, status: .todo)
        allTask.append(task)
        updateFilteredList()
    }
}

extension TaskModel: TaskDetailsVM {
    func updateTask(id: String, title: String, description: String, status: TaskStatus) {
        guard let index = allTask.firstIndex(where: { $0.id == id }) else {
            return
        }
        allTask[index].update(title: title, description: description, status: status)
        updateFilteredList()
    }
}

struct TaskData: Codable {
    let tasks: [TaskItemModel]
}

let data = """
    {"tasks":[{"id":"kvjfosdf","title":"Task 1","description":"Dynamic Programming (DP) is defined as a technique that solves some particular type of problems in Polynomial Time.","status":"To Do"},{"id":1,"title":"Task 2","description":"Dynamic Programming (DP) is defined as a technique that solves.","status":"In progress"},{"id":"2134kj652","title":"Task 3","description":"Dynamic Programming (DP) is defined as a technique that solves some particular type of problems in Polynomial Time.","status":"Done"},{"id":"34n5kj345","title":"Task 4","description":"Dynamic Programming is mainly an optimization over plain recursion. Wherever we see a recursive solution that has repeated calls for the same inputs, we can optimize it using Dynamic Programming. The idea is to simply store the results of subproblems so that we do not have to re-compute them when needed later. This simple optimization reduces time complexities from exponential to polynomial.","status":"To Do"}]}
""".data(using: .utf8)

