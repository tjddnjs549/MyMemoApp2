//
//  TodoViewController.swift
//  CoreDataMemoApp
//
//  Created by 박성원 on 2023/09/16.
//

import UIKit

final class TodoViewController: UIViewController {
    
    var dummmy: [String] = ["asd", "asd1", "asd2", "asd3", "asd4", "asd5"]
    
    
    let taskManager = CoreDataManager.shared
    // MARK: - properties
    
    private let tableView: UITableView = {
        let tbView = UITableView()
        tbView.translatesAutoresizingMaskIntoConstraints = false
        return tbView
    }()
    
    
    // MARK: - view lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewMakeUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension TodoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return taskManager.getTaskData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.todoTableViewCell, for: indexPath) as! TodoTableViewCell
        
        let taskList = taskManager.getTaskData()
        
        cell.task = taskList[indexPath.row]
        
        
        cell.selectionStyle = .none
        return cell
    }
}


extension TodoViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
}



// MARK: - viewSetting

private extension TodoViewController {
    
    
    func viewMakeUI() {
        view.backgroundColor = UIColors.clear
        naviBarSetting()
        tableViewSetting()
        tableViewMakeUI()
    }
    
    
    func tableViewSetting() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TodoTableViewCell.self, forCellReuseIdentifier: Cell.todoTableViewCell)
        
    }
    
    func tableViewMakeUI() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
    func naviBarSetting() {
        self.title = "Todo"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColors.white
        appearance.shadowColor = .none
        navigationController?.navigationBar.tintColor = UIColors.black
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        let plusButton = UIBarButtonItem(title: "추가", style: .done, target: self, action: #selector(plusButtonTapped))
        navigationItem.rightBarButtonItem = plusButton
        
        let backButton = UIBarButtonItem(title: "뒤로", style: .done, target: self, action: #selector(backButtonTapped))
        
        self.navigationItem.leftBarButtonItem = backButton
    }
}

// MARK: - @objc func

private extension TodoViewController {
    
    @objc func plusButtonTapped() {
        let detailVC = DetailViewController()
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
