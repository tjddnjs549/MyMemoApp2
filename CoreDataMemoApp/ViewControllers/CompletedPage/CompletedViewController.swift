//
//  CompletedViewController.swift
//  CoreDataMemoApp
//
//  Created by 박성원 on 2023/09/16.
//

import UIKit

final class CompletedViewController: UIViewController {
    
    
    let taskManager = CoreDataManager.shared
    
    // MARK: - properties
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    // MARK: - view lifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewMakeUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    private func viewMakeUI() {
        naviSetting()
        tableViewSetting()
        tableViewMakeUI()
    }
}


// MARK: - UITableViewDataSource

extension CompletedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskManager.filterIsCompleted().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.completedTableViewCell, for: indexPath) as! CompletedTableViewCell
        
        cell.task = taskManager.filterIsCompleted()[indexPath.row]
        
        return cell
    }
}


// MARK: - UITableViewDelegate

extension CompletedViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.task = taskManager.filterIsCompleted()[indexPath.row]
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
}


// MARK: - MakeUI

private extension CompletedViewController {
    
    func naviSetting() {
        view.backgroundColor = UIColors.white
        self.title = "Completed"
        
        navigationController?.navigationBar.tintColor = UIColors.black
        let backButton = UIBarButtonItem(title: "뒤로", style: .done, target: self, action: #selector(backButtonTapped))
        self.navigationItem.leftBarButtonItem = backButton
    }
    func tableViewSetting() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CompletedTableViewCell.self, forCellReuseIdentifier: Cell.completedTableViewCell)
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
}


// MARK: - @objc func

private extension CompletedViewController {
    
    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
   
}
