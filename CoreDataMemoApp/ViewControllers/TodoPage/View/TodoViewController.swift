//
//  TodoViewController.swift
//  CoreDataMemoApp
//
//  Created by 박성원 on 2023/09/16.
//

import UIKit

final class TodoViewController: UIViewController {
    
    private let viewModel: TodoViewModel
    
    // MARK: - properties
    
    private let tableView: UITableView = {
        let tbView = UITableView()
        tbView.translatesAutoresizingMaskIntoConstraints = false
        return tbView
    }()
    
    
    init(viewModel: TodoViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        return viewModel.taskList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.todoTableViewCell, for: indexPath) as! TodoTableViewCell
        let task = viewModel.taskList.sorted {$0.createDate! > $1.createDate! }[indexPath.row]
        
        cell.task = task
        cell.setSwitchOn(task.isCompleted)
        
        cell.selectionStyle = .none
        return cell
    }
}


extension TodoViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = DetailViewModel(dataManager: CoreDataManager.shared, title: "Detail")
        let detailVC = DetailViewController(viewModel: viewModel)
        detailVC.task = viewModel.taskList.sorted { $0.createDate! > $1.createDate! }[indexPath.row]
        
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        UIView.animate(withDuration: 0.3) {
            guard velocity.y != 0 else { return }
            if velocity.y < 0 {
                let height = self.tabBarController?.tabBar.frame.height ?? 0.0
                self.tabBarController?.tabBar.frame.origin = CGPoint(x: 0, y: UIScreen.main.bounds.maxY - height)
            } else {
                self.tabBarController?.tabBar.frame.origin = CGPoint(x: 0, y: UIScreen.main.bounds.maxY)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .normal, title: "Delete") { (action, view, completionHandler) in
            self.viewModel.deletedTodo(task: self.viewModel.taskList.sorted {$0.createDate! > $1.createDate! }[indexPath.row])
            self.tableView.reloadData()
            completionHandler(true)
        }
        deleteAction.backgroundColor = UIColors.orange
        deleteAction.image = UIImage(systemName: "trash.circle")
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        
        return configuration
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - viewSetting

private extension TodoViewController {
    
    func viewMakeUI() {
        view.backgroundColor = UIColors.clear
        tableViewSetting()
        naviBarSetting()
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
        self.title = viewModel.title
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
        navigationItem.leftBarButtonItem = backButton
    }
}

// MARK: - @objc func

private extension TodoViewController {
    
    @objc func plusButtonTapped() {
        let viewModel = DetailViewModel(dataManager: CoreDataManager.shared, title: "Detail")
        let detailVC = DetailViewController(viewModel: viewModel)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
