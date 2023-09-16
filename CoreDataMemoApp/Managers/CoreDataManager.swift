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
    
    
    // MARK: - [Read] 코어데이터에 저장된 데이터 모두 읽어오기
    func getTaskData() -> [Task] {
        var taskList: [Task] = []
        
        if let context = context {
            
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            
            let idOrder = NSSortDescriptor(key: "id", ascending: false)
            request.sortDescriptors = [idOrder]
            
            do {
                // 임시저장소에서 (요청서를 통해서) 데이터 가져오기 (fetch메서드)
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
    func saveTaskData(content: String?, modifyDate: Date?, completion: @escaping () -> Void) {
        
        if let context = context {
            
            
            if let entity = NSEntityDescription.entity(forEntityName: self.modelName, in: context) {
                
                if let taskData = NSManagedObject(entity: entity, insertInto: context) as? Task {
                    
                    taskData.id = UUID()
                    taskData.title = content
                    taskData.createDate = Date()
                    taskData.modifyDate = modifyDate
                    taskData.isCompleted = false
                    
                    if context.hasChanges {
                        do {
                            try context.save()
                            completion()
                        } catch {
                            print(error.localizedDescription)
                            completion()
                        }
                    }
                }
            }
        }
        completion()
    }
    
    // MARK: - [Delete] 코어데이터에서 데이터 삭제하기 (일치하는 데이터 찾아서 ===> 삭제)
    func deleteTaskData(data: Task, completion: @escaping () -> Void) {
        guard let id = data.id else {
            completion()
            return
        }
        if let context = context {
            
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            request.predicate = NSPredicate(format: "id = %@", id as CVarArg)
            
            do {
                if let fetchedTaskList = try context.fetch(request) as? [Task] {
                    if let targetTask = fetchedTaskList.first {
                        context.delete(targetTask)
                        if context.hasChanges {
                            do {
                                try context.save()
                                completion()
                            } catch {
                                print(error.localizedDescription)
                                completion()
                            }
                        }
                    }
                }
                completion()
            } catch {
                print("Delete ERROR: \(error.localizedDescription)")
                completion()
            }
        }
    }
    // MARK: - [Update] 코어데이터에서 데이터 수정하기 (일치하는 데이터 찾아서 ===> 수정)
    func updateTaskData(newTaskData: Task, completion: @escaping () -> Void) {
        guard let id = newTaskData.id else {
            completion()
            return
        }
        
        if let context = context {
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            request.predicate = NSPredicate(format: "id = %@", id as CVarArg)
            
            do {
                if let fetchedTaskList = try context.fetch(request) as? [Task] {
                    if var targetTask = fetchedTaskList.first {
                        targetTask = newTaskData
                        if context.hasChanges {
                            do {
                                try context.save()
                                completion()
                            } catch {
                                print(error.localizedDescription)
                                completion()
                            }
                        }
                    }
                }
                completion()
            } catch {
                print("Update ERROR: \(error.localizedDescription)")
                completion()
            }
        }
    }
}
