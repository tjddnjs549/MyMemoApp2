//
//  DetailViewController.swift
//  CoreDataMemoApp
//
//  Created by 박성원 on 2023/09/16.
//

import UIKit

final class DetailViewController: UIViewController {
    
    // MARK: - properties

    private let detailView = DetailView()
    let taskManager = CoreDataManager.shared
    
    
    var task: Task? {
        didSet {
            detailView.contentTextView.text = task?.title
            detailView.firstDate.text = task?.createDateString
            detailView.modifiedDate.text = task?.modifyDateString
        }
    }
    
    
    // MARK: - view LifeCycle
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        naviBarSetting()
    }
    

}


// MARK: - viewMakeUI

private extension DetailViewController {
    
    func naviBarSetting() {
        self.title = "추가"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColors.clear
        appearance.shadowColor = .none
        
        let backButton = UIBarButtonItem(title: "뒤로", style: .done, target: self, action: #selector(backButtonTapped))
        
        backButton.tintColor = UIColors.black
        self.navigationItem.leftBarButtonItem = backButton
        
    }
}

// MARK: - @objc func

extension DetailViewController {
    
    @objc func backButtonTapped() {
        if let task = self.task {
            task.title = detailView.contentTextView.text
            task.modifyDate = Date()
            taskManager.updateTaskData(newTaskData: task) {
            }
        } else {
            let title = detailView.contentTextView.text
            taskManager.saveTaskData(content: title, modifyDate: Date(), isCompleted: false) {
            }
        }
        self.navigationController?.popViewController(animated: true)
    }
}
