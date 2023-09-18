//
//  CategoryDataManeger.swift
//  CoreDataMemoApp
//
//  Created by 박성원 on 2023/09/18.
//

import UIKit
import CoreData


class CategoryDataManager {
    static let shared = CategoryDataManager()
    
    private let context: NSManagedObjectContext

    private init() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("AppDelegate를 가져올 수 없습니다.")
        }
        context = appDelegate.persistentContainer.viewContext
    }
    
    func getCategory() -> [Category] {
        let fetchRequest: NSFetchRequest<Category> = Category.fetchRequest()

        do {
            let categories = try context.fetch(fetchRequest)
            print(categories)
            return categories
        } catch {
            print("Search ERROR: \(error.localizedDescription)")
            return []
        }
    }
    
    func createCategory(title: String) {
        let newCategory = Category(context: context)
        newCategory.title = title
        newCategory.id = UUID()
        do {
            try context.save()
            print("createCategory")
        } catch {
            print("Create ERROR: \(error.localizedDescription)")
        }
    }

    func updateCategory(category: Category, newTitle: String) {
        category.title = newTitle

        do {
            try context.save()
            print("updateCategory.")
        } catch {
            print("Update ERROR: \(error.localizedDescription)")
        }
    }

}
