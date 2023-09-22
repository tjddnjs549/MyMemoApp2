//
//  DetailViewModel.swift
//  CoreDataMemoApp
//
//  Created by 박성원 on 2023/09/22.
//

import UIKit


final class DetailViewModel {
    
    var dataManager: CoreDataManager
    
    var title: String
    
    var taskList: [Task] {
        return dataManager.getTaskData()
    }
    
    init(dataManager: CoreDataManager, title: String) {
        self.dataManager = dataManager
        self.title = title
    }
    
    func addTask(title: String?, modifyDate: Date?, isCompleted: Bool) {
        dataManager.saveTaskData(content: title, modifyDate: modifyDate, isCompleted: isCompleted) {}
    }
    func update(newTask: Task) {
        dataManager.updateTaskData(newTaskData: newTask) {}
    }
}


