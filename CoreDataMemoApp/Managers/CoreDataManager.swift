//
//  CoreDataManager.swift
//  CoreDataMemoApp
//
//  Created by 박성원 on 2023/09/17.
//

import UIKit
import CoreData


final class CoreDataManager {
    
    static let shared = CoreDataManager()
    private init() {}
    
    let appDelegate: AppDelegate? = UIApplication.shared.delegate as? AppDelegate
    
    lazy var context: NSManagedObjectContext? = appDelegate?.persistentContainer.viewContext
    
    let modelName: String = "Task"
    
    
    func filterIsCompleted() -> [Task] {
        return getTaskData().filter { $0.isCompleted == true }
    }
    
    // MARK: - Read
    func getTaskData() -> [Task] {
        var taskList: [Task] = []
        
        if let context = context {
            
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            
            let dateOrder = NSSortDescriptor(key: "id", ascending: false)
            request.sortDescriptors = [dateOrder]
            
            do {
                if let fetchedTaskList = try context.fetch(request) as? [Task] {
                    taskList = fetchedTaskList
                }
            } catch {
                print("getTaskList ERROR: \(error.localizedDescription)")
            }
        }
        return taskList
    }
    
    
    // MARK: - Create
    func saveTaskData(content: String?, modifyDate: Date?, isCompleted: Bool, completion: @escaping () -> Void) {
        
        if let context = context {
            
            if let entity = NSEntityDescription.entity(forEntityName: self.modelName, in: context) {
                
                let taskData = Task(entity: entity, insertInto: context)
                
                taskData.id = UUID()
                taskData.title = content
                taskData.createDate = Date()
                taskData.modifyDate = modifyDate
                taskData.isCompleted = isCompleted
                appDelegate?.saveContext()
            }
            completion()
        }
    }
    
    // MARK: - Delete
    func deleteTaskData(data: Task, completion: @escaping () -> Void) {
        guard let date = data.createDate else { return }
        if let context = context {
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            request.predicate = NSPredicate(format: "createDate = %@", date as CVarArg)
            do {
                let fetchedTaskList = try context.fetch(request)
                if let targetTask = fetchedTaskList.first {
                    context.delete(targetTask)
                    appDelegate?.saveContext()
                }
                completion()
            } catch {
                print("Delete ERROR: \(error.localizedDescription)")
            }
        }
    }
    // MARK: - Update
    func updateTaskData(newTaskData: Task, completion: @escaping () -> Void) {
        guard let id = newTaskData.id else { return }
        if let context = context {
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            request.predicate = NSPredicate(format: "id = %@", id as CVarArg)
            do {
                let fetchedTask = try context.fetch(request)
                if var targetTask = fetchedTask.first {
                    targetTask = newTaskData
                    appDelegate?.saveContext()
                }
                completion()
            } catch {
                print("Update ERROR: \(error.localizedDescription)")
            }
        }
    }
    
    func completedTask(newTask: Task, isCompleted: Bool) {
        var _task = getTaskData()
        for index in 0..<_task.count {
            if _task[index].id == newTask.id {
                _task[index].isCompleted = isCompleted
            }
        }
        updateTaskData(newTaskData: newTask) {}
    }
}
