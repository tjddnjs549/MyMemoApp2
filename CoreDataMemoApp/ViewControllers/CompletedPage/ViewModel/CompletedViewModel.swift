//
//  CompletedViewModel.swift
//  CoreDataMemoApp
//
//  Created by 박성원 on 2023/09/21.
//

import UIKit


final class CompletedViewModel {
    
    var dataManager: CoreDataManager
    
    var title: String
    
    var taskList: [Task] {
        return self.dataManager.filterIsCompleted()
    }
    
    init(dataManager: CoreDataManager, title: String) {
        self.dataManager = dataManager
        self.title = title
    }
    
    
}
