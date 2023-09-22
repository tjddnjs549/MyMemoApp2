//
//  TodoViewModel.swift
//  CoreDataMemoApp
//
//  Created by 박성원 on 2023/09/22.
//

import Foundation


final class TodoViewModel {
    
    var dataManager: CoreDataManager
    
    var title: String
    
    
    var taskList: [Task] {
        return dataManager.getTaskData()
    }
    
    init(dataManager: CoreDataManager, title: String) {
        self.dataManager = dataManager
        self.title = title
    }
    
    func deletedTodo(task: Task) {
        dataManager.deleteTaskData(data: task) {}
    }
    
    func completedTask(data: Task, completed: Bool) {
        dataManager.completedTask(newTask: data, isCompleted: completed)
    }
}
