//
//  CoreDataManager.swift
//  CoreDataMemoApp
//
//  Created by 박성원 on 2023/09/17.
//

import UIKit
import CoreData


final class CoreDataManager {
    
    // 싱글톤
    static let shared = CoreDataManager()
    private init() {}
    
    // 앱 델리게이트
    let appDelegate: AppDelegate? = UIApplication.shared.delegate as? AppDelegate
    
    // 임시저장소
    lazy var context: NSManagedObjectContext? = appDelegate?.persistentContainer.viewContext //컨테이너의 임시 저정소 접근
    
    // 엔터티 이름 (코어데이터에 저장된 객체)
    let modelName: String = "Task"
    
    func filterIsCompleted() -> [Task] {
        return getTaskData().filter { $0.isCompleted == true }
    }
    
    // MARK: - [Read] 코어데이터에 저장된 데이터 모두 읽어오기
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
    
    
    //    @NSManaged public var id: UUID?
    //    @NSManaged public var title: String?
    //    @NSManaged public var createDate: Date?
    //    @NSManaged public var modifyDate: Date?
    //    @NSManaged public var isCompleted: Bool
    
    
    // MARK: - [Create] 코어데이터에 데이터 생성하기
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
    
    // MARK: - [Delete] 코어데이터에서 데이터 삭제하기 (일치하는 데이터 찾아서 ===> 삭제)
    func deleteTaskData(data: Task, completion: @escaping () -> Void) {
        guard let id = data.id else { return }
        if let context = context {
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            request.predicate = NSPredicate(format: "id = %@", id as CVarArg)
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
    // MARK: - [Update] 코어데이터에서 데이터 수정하기 (일치하는 데이터 찾아서 ===> 수정)
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
        var task = getTaskData()
        for index in 0..<task.count {
            if task[index].id == newTask.id {
                task[index].isCompleted = isCompleted
            }
        }
        updateTaskData(newTaskData: newTask) {
        }
    }
    
    func filterCategory(category: Category) -> [Task] {
        return getTaskData().filter { $0.category == category }
    }
}
