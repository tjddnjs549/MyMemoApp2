//
//  Task+CoreDataProperties.swift
//  CoreDataMemoApp
//
//  Created by 박성원 on 2023/09/18.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var createDate: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var isCompleted: Bool
    @NSManaged public var modifyDate: Date?
    @NSManaged public var title: String?
    @NSManaged public var category: Category?

}

extension Task : Identifiable {

}
