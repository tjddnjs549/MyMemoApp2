//
//  Task+CoreDataProperties.swift
//  CoreDataMemoApp
//
//  Created by 박성원 on 2023/09/20.
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

    var createDateString: String {
        get {
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "ko_KR")
            formatter.dateStyle = .medium
            formatter.timeStyle = .full
            formatter.dateFormat = "yyyy/MM/dd - hh:mm"
            
            return formatter.string(from: createDate!)
        }
    }
    var modifyDateString: String {
        get {
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "ko_KR")
            formatter.dateStyle = .medium
            formatter.timeStyle = .full
            formatter.dateFormat = "yyyy/MM/dd - hh:mm"
            
            return formatter.string(from: modifyDate!)
        }
    }
}

extension Task : Identifiable {

}
