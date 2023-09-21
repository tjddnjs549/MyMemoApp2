//
//  MainViewController.swift
//  CoreDataMemoApp
//
//  Created by 박성원 on 2023/09/16.

import UIKit

final class MainViewController: UIViewController {

    private let mainView = MainView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNaviBar()
    }
    
    private func setupNaviBar() {
        self.title = "Main"
        mainView.navigationController = self.navigationController!
    }
}
