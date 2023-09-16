//
//  DetailViewController.swift
//  CoreDataMemoApp
//
//  Created by 박성원 on 2023/09/16.
//

import UIKit

final class DetailViewController: UIViewController {
    
    private let detailView = DetailView()
    
    var task: Task? {
        didSet {
            
        }
    }
    
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        naviBarSetting()
    }

    
    private func naviBarSetting() {
        self.title = "추가"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColors.clear
        appearance.shadowColor = .none
        
        let backButton = UIBarButtonItem(title: "뒤로", style: .done, target: self, action: #selector(backButtonTapped))
        
        backButton.tintColor = UIColors.black
        self.navigationItem.leftBarButtonItem = backButton
        
    }
    
    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}


