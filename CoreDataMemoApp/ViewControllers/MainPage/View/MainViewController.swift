//
//  MainViewController.swift
//  CoreDataMemoApp
//
//  Created by 박성원 on 2023/09/16.

import UIKit

class MainViewController: UIViewController {

    private let viewModel: MainViewModel
    private let mainView = MainView()
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNaviBar()
    }
    
    private func setupNaviBar() {
        title = viewModel.title
        mainView.navigationController = self.navigationController!
    }
}


